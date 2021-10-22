import 'package:flutter/material.dart';
import 'package:flutter_fibu/bilanz_icon.dart';
import 'package:flutter_fibu/fibupreferences.dart';
import 'package:flutter_fibu/kpl_page.dart';
import 'package:flutter_fibu/main.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';
import 'JrlPage.dart';
import 'bug_icon.dart';
import 'download_icon.dart';
import 'generated/l10n.dart';
import 'jrl_icon.dart';
import 'kpl_icon.dart';
import 'ledger_icon.dart';
import 'outcome_icon.dart';

class NavDrawer extends StatelessWidget {
  late final Book book;
  late final FibuSettings settings;

  NavDrawer({Key? key, required this.book, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              S.of(context).NavTitle,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/accountancy.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(S.of(context).Start),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: () => //{Navigator.pop(context)},
            Navigator.pushNamed(
                context,
                MyHomePage.routeName,
                arguments: ScreenArguments(book, settings)
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text(S.of(context).kpl),
            onTap: () => 
            Navigator.pushNamed(
              context,
              KplPage.routeName,
              arguments: ScreenArguments(book, settings)
            ),
          ),
          ListTile(
            leading: //Icon(Icons.account_balance),
            JrlIcon(width: 30).draw(),
            title: Text(S.of(context).jrl),
            onTap: () =>
            Navigator.pushNamed(
                context,
                JrlPage.routeName,
                arguments: ScreenArguments(book, settings)
            ),
          ),
          ListTile(
            leading: //Icon(Icons.account_balance),
            BilanzIcon(width: 30).draw(),
            title: Text(S.of(context).bilanz),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.pushNamed(
                context,
                FibuPreferences.routeName,
                  arguments: ScreenArguments(book, settings)
              ),
          },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
    ],
      ),
    );
  }
}