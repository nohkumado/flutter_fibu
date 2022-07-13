import 'package:flutter/material.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_fibu/fibupreferences.dart';

import 'jrl_page.dart';
import 'kpl_page.dart';
import 'my_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
/// main starter, entrypoint
Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  //print("sharedPrefs: ${prefs.getKeys()}");
  runApp(ProviderScope(
    child:MyApp(prefs: prefs),
  ));
}

///the entry widget
class MyApp extends ConsumerWidget {

  SharedPreferences prefs;

  MyApp({Key? key, required this.prefs}) : super(key: key);

  /// here we build the whole app
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FibuSettings settings = ref.watch(settingsProvider);
    if(settings.empty())
    {
      for(String key in prefs.getKeys())
      {
        settings[key] = prefs.getString(key);
      }
      analyseFname(settings);
    };

    return MaterialApp(
      title: 'Nohfibu',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // static routes to allow the drawer to run around
      routes: <String, WidgetBuilder> {
        MyHomePage.routeName: (BuildContext context) => MyHomePage(title: "NohFibu"),
        KplPage.routeName: (BuildContext context) => KplPage(),
        JrlPage.routeName: (BuildContext context) => JrlPage(),
        FibuPreferences.routeName: (BuildContext context) => FibuPreferences(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "NohFibu", ),
    );
  }
  void analyseFname(FibuSettings settings) {
    String result = settings["key-filename"];
    int pos = result.lastIndexOf(".");
    if( pos>0)
    {
      settings["base"] = result.substring(0,pos);
      settings["type"] = result.substring(pos+1).trim();
    }
    else
    {
      settings["base"] = result;
      settings["type"] = "csv";
    }
  }
}
