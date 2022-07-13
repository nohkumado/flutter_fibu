import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'generated/l10n.dart';
import 'navdrawer.dart';
import 'jrl_page.dart';
import 'rp_provider.dart';

class KplPage extends ConsumerWidget{

  static const String routeName = "/kpl";
  KplPage({Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Book book = ref.watch(bookProvider);
    FibuSettings settings =  ref.watch(settingsProvider);

    //print("in KPL book is : ${widget.book}");
    List items = book.kpl.asList(silent: true, formatted:true);
    return Scaffold(
        drawer: NavDrawer(book: book, settings: settings),
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
                            DataCell(makeButton(text: line[0], context: context, book: book, settings: settings)), //acount nnumber
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
  Widget makeButton({required String text, required BuildContext context, required Book book, required FibuSettings settings})
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
          arguments: ScreenArguments(book, settings, extract:text)
      );},
      //child: Text(text, textAlign: TextAlign.left,),
      child:
      Align(alignment: Alignment.centerLeft, child:Text(text, textAlign: TextAlign.left,)),
    );
  }}

/*


Saving a file

final path = await getSavePath();
final name = "hello_file_selector.txt";
final data = Uint8List.fromList("Hello World!".codeUnits);
final mimeType = "text/plain";
final file = XFile.fromData(data, name: name, mimeType: mimeType);
await file.saveTo(path);

 */