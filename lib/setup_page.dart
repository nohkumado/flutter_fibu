import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/csv_handler.dart';
import 'package:nohfibu/nohfibu.dart';

import 'book_file_name.dart';
import 'generated/l10n.dart';

///displays choice of file to save/load
class SetupPage extends ConsumerWidget {

  SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Book book = ref.watch(bookProvider);
    FibuSettings settings =  ref.watch(settingsProvider);
    // empty on the first start: no book chosen yet
    final String fname = settings["key-filename"] ?? "";
    final bool hasBook = settings["base"] != null;

    return
          Center(
              child:
              Column(children: [
                Row(
                  children: [
                    Text(fname.isEmpty ? 'no book chosen yet' : 'need to load $fname!'),
                    IconButton(onPressed: (){ selectBase(ref: ref); }, icon: const Icon(Icons.save),tooltip: S.of(context).loadFile,),
                    IconButton(onPressed: !hasBook ? null : (){ CsvHandler().load(book: book, conf: settings); }, icon: const Icon(Icons.arrow_forward),tooltip: S.of(context).loadDefault)

                  ],
                ),
                ElevatedButton(
                    child:Text(S.of(context).save),
                    onPressed: !hasBook ? null : (){
                      var handler = CsvHandler();
                      File file = File(settings["base"]);
                      print("asked to save $file and ${file.existsSync()}");
                      handler.save(book: book, conf: settings);
                      //print("saved $book");
                    }
                ) ,
                //SvgPicture.asset(
                //    "assets/images/kpl.svg",
                //    semanticsLabel: 'Acme Logo'
                //),
                //KplIcon(width: 50).draw(),
                //BugIcon(width: 100).draw(),
                //DownloadIcon(width: 100).draw(),
                //LedgerIcon(width: 100).draw(),
                //OutcomeIcon(width: 100).draw(),

              ],)
      );
  }
  void selectBase({required WidgetRef ref})
  {
    Book book = ref.watch(bookProvider);
    FibuSettings settings =  ref.watch(settingsProvider);
    //file_selector
    // final typeGroup = XTypeGroup(label: 'data', extensions: ['csv']);
    //openFile(acceptedTypeGroups: [typeGroup]).then((file){print("got back $file");});
    FilePicker.pickFile(type: FileType.custom, allowedExtensions: ['csv']).then(
            (file) async {
          if (file != null) {
            //as web app, there's no path, the data comes with the selection;
            //desktop and mobile give a path
            String  fileBytes = "";
            String result = "";

              if (file.path == null) {
                result = file.name;
                fileBytes = utf8.decode(await file.readAsBytes());
              }
              else {
                result = file.path!;
              }
              // the chosen book, remembered in the settings
              ref.read(settingsProvider.notifier)["key-filename"] = result;
              settings = ref.read(settingsProvider);
              //print("set result to  : ${result}, $fileBytes");

            //Settings().save("key-filename", "${result}"); //TODO ensure that the preferences a stored!!!
            //print("dialog retrieved : raw: ${fileBytes}  n-- ${result} vs $fname");

              analyseFname(settings);
              //File file = File(settings["base"]+"."+ settings["type"]);
              //print("changed $file and ${file.existsSync()}");

            if(fileBytes.isNotEmpty)
            {
              //web... sends the file together with the file selection
              CsvHandler().load(book: book, conf: settings, data: fileBytes);
            }
            else CsvHandler().load(book: book, conf: settings);
            //setState(() {

            //});
          }
          else {
            // User canceled the picker
          }
        });
  }}

/*
   just storing a receipe

   Saving a file

   final path = await getSavePath();
   final name = "hello_file_selector.txt";
   final data = Uint8List.fromList("Hello World!".codeUnits);
   final mimeType = "text/plain";
   final file = XFile.fromData(data, name: name, mimeType: mimeType);
   await file.saveTo(path);

*/
