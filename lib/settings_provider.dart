import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';

/// The app's settings; every change is a new [FibuSettings] (copyWith).
class SettingsNotifier extends Notifier<FibuSettings>
{
  SettingsNotifier({this.initial});

  /// Settings to start with (tests), else the defaults.
  final FibuSettings? initial;

  @override
  FibuSettings build() => initial ?? FibuSettings();

  /// the setter to set the data if needed
  void operator []=(String key, dynamic val) {
    state = state.copyWith(key: key, value: val);
  }


}
