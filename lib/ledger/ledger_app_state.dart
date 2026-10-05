import 'package:nohfibu/nohfibu.dart';

/// The book's history open in the app (or none: the app works on plain
/// files then): the repository, the state replayed from it, what did not
/// open. A new [ledger] after a sync or a restore — the screens follow.
class LedgerAppState {
  /// The book's name, null when no history is open.
  final String? book;
  final LedgerRepo? repo;
  final Ledger? ledger;
  final List<String> problems;

  /// Why the last action failed ("" when it did not).
  final String error;

  const LedgerAppState({this.book, this.repo, this.ledger, this.problems = const [], this.error = ''});

  bool get open => ledger != null;

  LedgerAppState withError(String e) => LedgerAppState(book: book, repo: repo, ledger: ledger, problems: problems, error: e);
}
