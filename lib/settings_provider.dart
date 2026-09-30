import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';

class SettingsNotifier extends StateNotifier<FibuSettings>
{
  SettingsNotifier({FibuSettings? settings}) : super(settings ?? FibuSettings());
  /// the setter to set the data if needed
  void operator []=(String key, dynamic val) {
    final updatedSettings = state.copyWith(key: key, value: val);
    //state[key] = val;
    state = updatedSettings;
  }


}
