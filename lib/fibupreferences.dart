import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:settings_ui/settings_ui.dart';

     // SettingsList(
     //   sections: [
     //     SettingsSection(
     //       title: const Text('General'),
     //       tiles: settingsMap.values.toList(),

     //     ),
     //   ],
     // );

class FibuPreferences extends ConsumerWidget
{
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FibuSettings settings = ref.watch(settingsProvider);

    return
    SettingsList(
      sections: [
        SettingsSection(
          title: const Text('General'),
          tiles: [
            SettingsTile(

              title: const Text('Language'),
              leading:
              Icon(Icons.language),
              value: TextField(
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier)["lang"]= value;
                  },
                  controller: TextEditingController(text:settings['lang'] ?? 'de')
              ),
              description: Text( "Language setting"),

            ),
            SettingsTile(
              title: const Text('Basename'),
              leading: Icon(Icons.folder),
              value: TextField(
                onChanged: (value) {
                  // Update using bracket notation
                  ref.read(settingsProvider.notifier)["base"] = value;
                },
                controller: TextEditingController(text: settings["base"] ?? ''),
              ),
            ),
            SettingsTile(
              title: const Text('Output'),
              leading: Icon(Icons.text_snippet),
              value: TextField(
                onChanged: (value) {
                  // Update using bracket notation
                  ref.read(settingsProvider.notifier)["output"] = value;
                },
                controller: TextEditingController(text: settings["output"] ?? ''),
              ),
            ),
            SettingsTile.switchTile(
              title: const Text('Help'),
              leading: Icon(Icons.help),
              initialValue: settings["help"]?? false,
              onToggle: (value) {
                ref.read(settingsProvider.notifier)["help"] = value;
              },
            ),
            SettingsTile.switchTile(
              title: const Text('Strict'),
              leading: Icon(Icons.settings_suggest),
              initialValue: settings["strict"] ?? false,
              onToggle: (value) {
                ref.read(settingsProvider.notifier)["strict"] = value; // typo corrected (should be 'strict')
              },
            ),
            SettingsTile(
              title: const Text('Version'),
              leading: Icon(Icons.info),
              value: Text('Version: ${settings["version"]?? 'Unknown'}'),
            ),
          ],
        ),
      ],
    );


  }
}
