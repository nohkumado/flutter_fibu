import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../invoicing/invoice_files.dart';
import 'ledger_app_state.dart';
import 'ledger_keys.dart';

/// The book's history in the app: open it (the last one again at start),
/// start one from the books kept as files, record what the screens changed
/// ([commit] — they keep working on book and archive, the diff becomes a
/// change of this device), sync with the hub, back up and restore.
class LedgerNotifier extends Notifier<LedgerAppState> {
  LedgerNotifier({this.base});

  /// Where histories live (tests); else [InvoiceFiles.locate].
  final InvoiceFiles? base;

  Map<String, dynamic>? _before;

  static const _lastBook = 'ledger-book';

  @override
  LedgerAppState build() {
    _reopen();
    return const LedgerAppState();
  }

  Future<InvoiceFiles> _files() async => base ?? await InvoiceFiles.locate();

  Future<void> _reopen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final book = prefs.getString(_lastBook);
      if (book != null) await open(book);
    } catch (_) {
      // no preferences (tests): nothing to reopen
    }
  }

  /// Opens [book]'s history (with [key] when this device gets it now: a
  /// pairing, a restore, the password manager). Throws when this device
  /// has no key for it.
  Future<void> open(String book, {LedgerKey? key}) async {
    final f = await _files();
    final keys = LedgerKeys(f.base);
    if (key != null) await keys.write(book, key);
    final k = key ?? await keys.read(book);
    if (k == null) throw StateError('no key for "$book" on this device — pair it, restore a backup, or enter the key');
    final repo = await LedgerRepo.open(f.base, book, key: k);
    _show(repo);
    try {
      (await SharedPreferences.getInstance()).setString(_lastBook, book);
    } catch (_) {}
  }

  void _show(LedgerRepo repo) {
    final ledger = repo.ledger;
    _before = LedgerDiff.capture(book: ledger.book, store: ledger.store, letterheads: _letterheads(ledger));
    if (ref.mounted) state = LedgerAppState(book: repo.book, repo: repo, ledger: ledger, problems: repo.problems);
  }

  static List<Letterhead> _letterheads(Ledger l) => [for (final e in l.letterheads.entries) Letterhead.parse(e.value, id: e.key)];

  /// Starts a history for [book] on this device from what is kept as files
  /// now: the open [from] book, the invoice [store], the [letterheads].
  Future<void> start(String book, {Book? from, InvoiceStore? store, Iterable<Letterhead> letterheads = const []}) async {
    final f = await _files();
    final key = LedgerKey.generate();
    await LedgerKeys(f.base).write(book, key);
    final repo = await LedgerRepo.open(f.base, book, key: key);
    if (repo.graph.length > 0) throw StateError('"$book" has a history already');
    await repo.record(Ledger.snapshot(book: from, store: store, letterheads: letterheads));
    _show(repo);
    try {
      (await SharedPreferences.getInstance()).setString(_lastBook, book);
    } catch (_) {}
  }

  /// Records what changed in the open book, archive and letterheads since
  /// the last commit — one change of this device. Call after every action.
  Future<void> commit() async {
    final s = state;
    if (!s.open || _before == null) return;
    final letterheads = _letterheads(s.ledger!);
    final ops = LedgerDiff.since(_before!, book: s.ledger!.book, store: s.ledger!.store, letterheads: letterheads);
    _before = LedgerDiff.capture(book: s.ledger!.book, store: s.ledger!.store, letterheads: letterheads);
    await s.repo!.record(ops);
  }

  /// Keeps a letterhead in the history (it travels to the other devices).
  Future<void> putLetterhead(Letterhead l) async {
    final s = state;
    if (!s.open) return;
    s.ledger!.letterheads[l.id] = l.toYaml();
    await commit();
  }

  /// Syncs with the hub of [invitation] (pairs this device the first time).
  Future<SyncResult> sync(SyncInvitation invitation) async {
    if (state.book != invitation.book || !state.open) await open(invitation.book, key: invitation.key);
    final repo = state.repo!;
    await commit();
    final result = await SyncClient(invitation, repo.device).sync(repo.graph);
    await repo.saveAll();
    _show(repo);
    return result;
  }

  /// After changes came in from elsewhere (this app being the hub): the
  /// files saved, the book replayed.
  Future<void> refresh() async {
    final repo = state.repo;
    if (repo == null) return;
    await repo.saveAll();
    _show(repo);
  }

  /// The history under [passphrase], to save anywhere.
  Future<String> backup(String passphrase) async {
    await commit();
    return LedgerBackup.export(state.repo!.graph, passphrase);
  }

  /// Brings a backup into [book] (a new device: the key is new, the
  /// history the backup's).
  Future<int> restore(String book, String text, String passphrase) async {
    final changes = await LedgerBackup.restore(text, passphrase);
    final f = await _files();
    final keys = LedgerKeys(f.base);
    final key = await keys.read(book) ?? LedgerKey.generate();
    await keys.write(book, key);
    final repo = await LedgerRepo.open(f.base, book, key: key);
    final added = repo.graph.merge(changes);
    await repo.saveAll();
    _show(repo);
    return added;
  }

  /// Back to the plain files.
  Future<void> close() async {
    await commit();
    state = const LedgerAppState();
    try {
      (await SharedPreferences.getInstance()).remove(_lastBook);
    } catch (_) {}
  }
}
