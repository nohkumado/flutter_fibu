import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nohfibu/nohfibu.dart';

/// Where a book's key lives: on a phone in its secure storage (Android
/// Keystore — not in the files, not in any backup); on the desktop in the
/// key file the `ledger` command line uses (`<base>/keys/<book>.key`).
class LedgerKeys {
  final Directory base;

  const LedgerKeys(this.base);

  static bool get _phone => Platform.isAndroid || Platform.isIOS;
  static const _secure = FlutterSecureStorage();

  File _file(String book) => File('${base.path}/keys/$book.key');

  /// The key of [book], or null when this device has none (pair it, or
  /// restore a backup, or take the key from the password manager).
  Future<LedgerKey?> read(String book) async {
    if (_phone) {
      final text = await _secure.read(key: 'nohfibu-key-$book');
      return text == null ? null : LedgerKey.fromBase64(text);
    }
    final f = _file(book);
    return f.existsSync() ? LedgerKey.fromBase64(f.readAsStringSync()) : null;
  }

  /// Keeps [key] for [book].
  Future<void> write(String book, LedgerKey key) async {
    if (_phone) {
      await _secure.write(key: 'nohfibu-key-$book', value: key.toBase64());
      return;
    }
    final f = _file(book);
    f.parent.createSync(recursive: true);
    f.writeAsStringSync('${key.toBase64()}\n');
    if (!Platform.isWindows) Process.runSync('chmod', ['600', f.path]);
  }

  /// Forgets the key of [book] on this device (the history becomes
  /// unreadable here — keep a backup or the password manager's copy).
  Future<void> delete(String book) async {
    if (_phone) {
      await _secure.delete(key: 'nohfibu-key-$book');
      return;
    }
    final f = _file(book);
    if (f.existsSync()) f.deleteSync();
  }
}

