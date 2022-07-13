import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/csv_handler.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'navdrawer.dart';
import 'generated/l10n.dart';

///HomePage = entry page atm only a disply and selection of the dataset to be used
class MyHomePage extends ConsumerWidget {
	static const String routeName = "/home";


	MyHomePage({Key? key, required this.title}) : super(key: key);


	final String title;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
		String fname = "argh";
		Book book = ref.watch(bookProvider);
		FibuSettings settings =  ref.watch(settingsProvider);

		fname= settings["key-filename"];
		print("Settings: ${settings}");
		print("retrieved filename : $fname");
		return Scaffold(
				drawer: NavDrawer(book: book, settings:settings),
				appBar: AppBar(
					title: Text(S.of(context).AppTitle),
				),
				body: Center(
						child:
						Column(children: [
							Row(
								children: [
									Text('need to load $fname!'),
									IconButton(onPressed: (){ selectBase(ref: ref); }, icon: const Icon(Icons.save)),
									IconButton(onPressed: (){ CsvHandler().load(book: book, conf: settings); }, icon: const Icon(Icons.arrow_forward))

								],
							),
							ElevatedButton(
									child:Text(S.of(context).save),
									onPressed: (){
										var handler = CsvHandler();
										File file = File(settings["base"]);
										//print("asked to save $file and ${file.existsSync()}");
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
				)
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
	void selectBase({required WidgetRef ref})
	{
		Book book = ref.watch(bookProvider);
		FibuSettings settings =  ref.watch(settingsProvider);
		//file_selector
		// final typeGroup = XTypeGroup(label: 'data', extensions: ['csv']);
		//openFile(acceptedTypeGroups: [typeGroup]).then((file){print("got back $file");});
		FilePicker.platform.pickFiles( type: FileType.custom, allowedExtensions: ['csv'], ).then(
						(value) {
					if (value != null) {
						//print("dialog retrieved : ${value.files.single.path} vs stored $fname");
						//as web app, there's no path, the data comes directly as bytestring, desktop, we get a path
						String  fileBytes = "";
						String result = "";

						if (value.files.first != null) {
							if (value.files.first.bytes != null) {
								result = "${value.files.first.name}";
								fileBytes = utf8.decode(value.files.first.bytes!);
							}
							else {
								result = "${value.files.single.path}";
							}
							//print("set result to  : ${result}, $fileBytes");
						}

						Settings().save("key-filename", "${result}");
						//print("dialog retrieved : raw: ${fileBytes}  n-- ${result} vs $fname");

						if(result != null)
						{
							analyseFname(settings);
							//File file = File(settings["base"]+"."+ settings["type"]);
							//print("changed $file and ${file.existsSync()}");
						}

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