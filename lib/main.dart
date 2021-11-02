import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_fibu/fibupreferences.dart';

import 'jrl_icon.dart';
import 'jrl_page.dart';
import 'kpl_page.dart';
import 'my_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
/// main starter, entrypoint
Future<void> main() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

///the entry widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// here we build the whole app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nohfibu',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // static routes to allow the drawer to run around
      routes: <String, WidgetBuilder> {
        MyHomePage.routeName: (BuildContext context) => const MyHomePage(title: "NohFibu"),
        KplPage.routeName: (BuildContext context) => KplPage(),
        JrlPage.routeName: (BuildContext context) => JrlPage(),
        FibuPreferences.routeName: (BuildContext context) => FibuPreferences(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "NohFibu"),
    );
  }
}
