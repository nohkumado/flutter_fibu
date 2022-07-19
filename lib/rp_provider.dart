import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'act_widget.dart';
import 'book_notifier.dart';
import 'manual_provider.dart';
import 'nav_notifier.dart';
import 'settings_provider.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier,FibuSettings>((ref) => SettingsNotifier());
final bookProvider = StateNotifierProvider<BookNotifier,Book>((ref) => BookNotifier());
final navProvider = StateNotifierProvider<NavNotifier,ActWidget>((ref) => NavNotifier());
final manualProvider = StateNotifierProvider<ManualNotifier,String>((ref) => ManualNotifier());

