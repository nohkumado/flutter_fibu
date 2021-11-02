import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'generated/l10n.dart';
import 'navdrawer.dart';
import 'jrl_page.dart';

class KplPage extends StatefulWidget {
  Book book = new Book();
  FibuSettings settings = FibuSettings();

  static const String routeName = "/kpl";
  KplPage({Key? key, book, settings}) : super(key: key)
  {
    if(book != null) this.book = book;
    if(settings != null) this.settings = settings;
  }


  @override
  State<KplPage> createState() => _KplPageState();
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
class _KplPageState extends State<KplPage> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if(args != null)
    {
      widget.book = args.book;
      widget.settings = args.settings;
    }
    ;
    //print("in KPL book is : ${widget.book}");
    List items = widget.book.kpl.asList(silent: true);
    return Scaffold(
        drawer: NavDrawer(book: widget.book, settings: widget.settings),
        appBar: AppBar( title: Text(S.of(context).KplTitle) ),
        body: Center(
            child:
                SingleChildScrollView(
                  child:
                    DataTable(
                        columns: [  DataColumn(label: Text("kto nr")),DataColumn(label: Text("desc ")),DataColumn(label: Text("cur")), DataColumn(label: Text("budget")), DataColumn(label: Text("valuta"))],
                        rows: items.map((line)
                        {
                          return DataRow(
                              cells: [
                                DataCell(makeButton(line[0])), //acount nnumber
                                DataCell(Text((line.length >1)?"${line[1]}":"no data")),//acc desc
                                DataCell(Text((line.length >2)?"${line[2]}":"no data")),//acc cur
                                DataCell(Text((line.length >3)?"${line[3]}":"no data")),//acc budget
                                DataCell(Text((line.length >4)?"${line[4]}":"no data")),//acc valuta
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


  Widget makeButton(String text)
  {
    return RaisedButton(child: Text(text), onPressed: ()
	{
		  Navigator.pushNamed(
		      context,
		      JrlPage.routeName,
		      arguments: ScreenArguments(widget.book, widget.settings, extract:text)
		  );
	},); 
  }
}
