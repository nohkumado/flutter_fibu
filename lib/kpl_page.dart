import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'act_widget.dart';
import 'rp_provider.dart';

class KplPage extends ConsumerWidget{

  static const String routeName = "/kpl";
  KplPage({Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("in KPL building view");
    Book book = ref.watch(bookProvider);
    ActWidget actPage = ref.watch(navProvider);
    print("actPage is ${actPage.name}");
    FibuSettings settings =  ref.watch(settingsProvider);

    List items = book.kpl.asList(silent: true, formatted:true);
    Map<String,TextEditingController> editors = {};
    List<String> labels = ["kto nr","desc","cur","budget","valuta"]; //TODO internationalization here
    labels.forEach((key) { editors[key] = TextEditingController( ); });
    List<DataRow> drows = items.map((line)
    {
      return DataRow(
          cells: [
            DataCell(makeButton(text: line[0], context: context, book: book, settings: settings, ref: ref)), //acount nnumber
            DataCell(Text((line.length >1)?"${line[1]}":"no data")),//acc desc
            DataCell(Text((line.length >2)?"${line[2]}":"no data")),//acc cur
            DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >3)?"${line[3]}":"no data"))), //acc budget
            DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >4)?"${line[4]}":"no data"))), //acc valuta
          ]);
    }).toList();
     drows.add(
         DataRow(
             cells: [
               DataCell(Text( labels[0], )), //acount nnumber
               DataCell(Text( labels[1], )),//acc desc
               DataCell(Text( labels[2], )),//acc cur
               DataCell(Text( labels[3], )), //acc budget
               DataCell(Text( labels[4], )), //acc valuta
             ])
     );
   drows.add(
       DataRow(
           cells: [
             DataCell(TextField( controller: editors[labels[0]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[0], ),)), //acount nnumber
             DataCell(TextField( controller: editors[labels[1]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[1], ), )),//acc desc
             DataCell(TextField( controller: editors[labels[2]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[2], ),)),//acc cur
             DataCell(TextField( controller: editors[labels[3]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[3], ), )), //acc budget
             DataCell(TextButton(
               child: Text("add"),
               onPressed: (()
               {
                 print("pressed add ....");
                 //editors.forEach((key, value) { print("k: $key with ${value.text}");});
                 ref.read(bookProvider.notifier).addAccount(name: editors["kto nr"]!.text, desc: editors["desc"]!.text, cur:editors["cur"]!.text, budget:editors["budget"]!.text,);
               }),
             )), //acc valuta
           ])
   );

    return
        Center(
            child:
            SingleChildScrollView(
                child: Column(
                  children: [
                    DataTable(
                        columns: [  DataColumn(label: Text(labels[0])),DataColumn(label: Text(labels[1])),DataColumn(label: Text(labels[2])), DataColumn(label: Text(labels[3])), DataColumn(label: Text(labels[4]))],
                       rows: drows,
                       //rows: items.map((line)
                       //{
                       //  return DataRow(
                       //      cells: [
                       //        DataCell(makeButton(text: line[0], context: context, book: book, settings: settings)), //acount nnumber
                       //        DataCell(Text((line.length >1)?"${line[1]}":"no data")),//acc desc
                       //        DataCell(Text((line.length >2)?"${line[2]}":"no data")),//acc cur
                       //        DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >3)?"${line[3]}":"no data"))), //acc budget
                       //        DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >4)?"${line[4]}":"no data"))), //acc valuta
                       //      ]);
                       //}).toList()
                    ),
                  // Row(
                  //   children:
                  //   [
                  //     Expanded(child:
                  //     TextField(
                  //       controller: editors["kto nr"],
                  //     )
                  //     )

                  //   ]
                  //   //labels.map((label) => Expanded(child: TextField(
                  //   //  controller: editors[label],
                  //   //))).toList()
                  //   ,
                  // )
                  ],
                )
            )
    );
  }
  Widget makeButton({required String text, required BuildContext context, required Book book, required FibuSettings settings, required WidgetRef ref})
  {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        print("pressed  $text");

        ref.read(navProvider.notifier).chgPage("jrlview", args: ScreenArguments(extract:text));
      //  Navigator.pushNamed(
      //    context,
      //    JrlPage.routeName,
      //    arguments: ScreenArguments(book, settings, extract:text)
      //);
        },
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