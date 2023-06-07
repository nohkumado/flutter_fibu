import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';


class FibuPreferences extends ConsumerWidget
{
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //FibuSettings settings = ref.watch(settingsProvider);
    return SettingsScreen(
      title: "Application Settings",
      children: [
        TextFieldModalSettingsTile(
          settingKey: 'key-filename',
          title: 'choose your file',
          defaultValue: 'sample',
          cancelCaption: 'Cancel',
          okCaption: 'Save filename',
          keyboardType: TextInputType.text,
        ),

      ],
    )
    ;
  }
}