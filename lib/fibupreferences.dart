import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'navdrawer.dart';

class FibuPreferences extends StatefulWidget
{
    @override
    _FibuPreferencesState createState() => _FibuPreferencesState();
}

class _FibuPreferencesState  extends State<FibuPreferences>
{
  @override
  Widget build(BuildContext context) {
    return

      //Scaffold(
      //drawer: NavDrawer(),
      //appBar: AppBar(
      //  title: Text('Side menu'),
      //),
      //body:SafeArea(child:
      SettingsScreen(
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
   //  )
   //);
  }
}