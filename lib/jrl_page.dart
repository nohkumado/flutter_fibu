import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'generated/l10n.dart';
import 'navdrawer.dart';

class JrlPage extends StatefulWidget {
  Book book = new Book();
  FibuSettings settings = FibuSettings();

  static const String routeName = "/jrl";
  JrlPage({Key? key, book, settings}) : super(key: key)
  {
    if(book != null) this.book = book;
    if(settings != null) this.settings = settings;
  }


  @override
  State<JrlPage> createState() => _JrlPageState();
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
class _JrlPageState extends State<JrlPage> {

  @override
  Widget build(BuildContext context) {
    String extract = "";
    if(ModalRoute.of(context)!.settings.arguments != null)
    {
      final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      if(args != null)
      {
	widget.book = args.book;
	widget.settings = args.settings;
	if(args.extract != null && args.extract.isNotEmpty) extract = args.extract;
      }
      ;
    }
    //print("in KPL book is : ${widget.book}");
    List items = widget.book.jrl.asList([],silent: true);
    return Scaffold(
        drawer: NavDrawer(book: widget.book, settings: widget.settings),
        appBar: AppBar( title: Text(S.of(context).JrlTitle) ),
        body: Center(
            child:
            SingleChildScrollView(
                child:
                DataTable(
                    columns: [  DataColumn(label: Text("Datum")),DataColumn(label: Text("kto- ")),DataColumn(label: Text("kto+")), DataColumn(label: Text("desc")), DataColumn(label: Text("cur")), DataColumn(label: Text("valuta")), DataColumn(label: Text("sum"))],
                    rows: items.map((line)
                    {
                      return DataRow(
                          cells: [
                            DataCell(Text(line[0])),
                            DataCell(Text((line.length >1)?"${line[1]}":"no data")),
                            DataCell(Text((line.length >2)?"${line[2]}":"no data")),
                            DataCell(Text((line.length >3)?"${line[3]}":"no data")),
                            DataCell(Text((line.length >4)?"${line[4]}":"no data")),
                            DataCell(Text((line.length >5)?"${line[5]}":"no data")),
                            DataCell(Text((line.length >6)?"${line[6]}":"no data")),
                          ]);
                    }).toList()


                )
            )

          //ListView.builder(
          //    itemCount: items.length,
          //    itemBuilder: (BuildContext context, int index) {
          //      List data = items[index];
          //      return Container(
          //        height: 50,
          //        margin: EdgeInsets.all(2),
          //        child: Row(
          //          children: data.map((e) => Text("$e")).toList(),
          //        ),
          //      );

          //    }
          //),
        )
    );
  }
}
