import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fibu/fibupreferences.dart';
import 'package:flutter_fibu/kpl_icon.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/csv_handler.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:nohfibu/ops_handler.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'JrlPage.dart';
import 'bug_icon.dart';
import 'download_icon.dart';
import 'kpl_page.dart';
import 'ledger_icon.dart';
import 'navdrawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'outcome_icon.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      routes: <String, WidgetBuilder> {
        MyHomePage.routeName: (BuildContext context) => MyHomePage(title: "NohFibu"),
        KplPage.routeName: (BuildContext context) => KplPage(),
        JrlPage.routeName: (BuildContext context) => JrlPage(),
        FibuPreferences.routeName: (BuildContext context) => FibuPreferences(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "NohFibu"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/home";

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*


Saving a file

final path = await getSavePath();
final name = "hello_file_selector.txt";
final data = Uint8List.fromList("Hello World!".codeUnits);
final mimeType = "text/plain";
final file = XFile.fromData(data, name: name, mimeType: mimeType);
await file.saveTo(path);

 */
class _MyHomePageState extends State<MyHomePage> {

  Book book = new Book();
  FibuSettings settings = FibuSettings();
  String fname = "argh";


  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null) {
      final args = ModalRoute
          .of(context)!
          .settings
          .arguments as ScreenArguments;
        book = args.book;
        settings = args.settings;
    }
    Settings().getString( 'key-filename', 'none' ).then((value) {
      fname= value!;
      return;
    });
    print("retrieved $fname");
    return Scaffold(
      drawer: NavDrawer(book: book, settings:settings),
      appBar: AppBar(
        title: Text(S.of(context).AppTitle),
      ),
      body: Center(
          child:
          Settings().onStringChanged(
            settingKey: 'key-filename',
            defaultValue: 'Empty',
            childBuilder: (context, value){
              fname= value!;
              return Column(children: [
                Row(
                  children: [
                    Text('need to load $fname!'),
                    IconButton(onPressed: (){
                      //file_selector
                      // final typeGroup = XTypeGroup(label: 'data', extensions: ['csv']);
                      //openFile(acceptedTypeGroups: [typeGroup]).then((file){print("got back $file");});
                      FilePicker.platform.pickFiles( type: FileType.custom, allowedExtensions: ['csv'], ).then(
                              (value) {
                            if (value != null) {
                              //print("dialog retrieved : ${value.files.single.path} vs $fname");
                              String result = "${value.files.single.path}";
                              Settings().save("key-filename", "${value.files.single.path}");

                              if(value.files.single.path != null)
                              {
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
                                File file = File(settings["base"]+"."+ settings["type"]);
                                print("changed $file and ${file.existsSync()}");
                              }
                              //setState(() {

                              //});
                            }
                            else {
                              // User canceled the picker
                            }
                          });

                    }, icon: Icon(Icons.save)),
                    IconButton(onPressed: (){
                      var handler = CsvHandler();
                      File file = File(settings["base"]);
                      print("asked to open $file and ${file.existsSync()}");
                      handler.load(book: book, conf: settings);
                      print("loaded $book");
                    }, icon: Icon(Icons.arrow_forward))

                  ],
                ),
                //SvgPicture.asset(
                //    "assets/images/kpl.svg",
                //    semanticsLabel: 'Acme Logo'
                //),
                //KplIcon(width: 50).draw(),
                //BugIcon(width: 100).draw(),
                //DownloadIcon(width: 100).draw(),
                //LedgerIcon(width: 100).draw(),
                //OutcomeIcon(width: 100).draw(),

              ],);
            },
          )
      ),
    );
  }
}
