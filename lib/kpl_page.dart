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
    List items = widget.book.kpl.asList(silent: true, formatted:true);
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
                                DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >3)?"${line[3]}":"no data"))), //acc budget
                                DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >4)?"${line[4]}":"no data"))), //acc valuta
                              ]);
                        }).toList()
                    )
                )
        )
    );
  }


  Widget makeButton(String text)
  {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () { Navigator.pushNamed(
          context,
          JrlPage.routeName,
          arguments: ScreenArguments(widget.book, widget.settings, extract:text)
      );},
      //child: Text(text, textAlign: TextAlign.left,),
      child:
      Align(alignment: Alignment.centerLeft, child:Text(text, textAlign: TextAlign.left,)),
    );
  }
}
