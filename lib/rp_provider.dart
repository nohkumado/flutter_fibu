import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'book_notifier.dart';
import 'settings_provider.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier,FibuSettings>((ref) => SettingsNotifier());
final bookProvider = StateNotifierProvider<BookNotifier,Book>((ref) => BookNotifier());

