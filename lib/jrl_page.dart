import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'generated/l10n.dart';
import 'navdrawer.dart';
import 'rp_provider.dart';

///the page that displays the journal or extract for a certain account
class JrlPage extends ConsumerWidget {
  String extract = "";

  static const String routeName = "/jrl";
  JrlPage({Key? key}) : super(key: key) ;
  Widget build(BuildContext context, WidgetRef ref) {
    print("drawing jrl ");
    Book book = ref.watch(bookProvider);
    FibuSettings settings = ref.watch(settingsProvider);

    late List items;

    if(extract.isNotEmpty)
    {
      Konto? extK = book.kpl.get(extract);
      if(extK !=null)
      {
        if(extK.extract == null ) {
          book.jrl.execute();
        } else
        {
          if(extK.extract.count() <= 0)
          {
            book.jrl.execute();
            //TODO check if this node is empty but has chikldren in that case we should aggreagte all sub nodes
          }
        }
        items = extK.extract.asList([],silent: true, formatted: true);

      }
      else {
        print("#### Error kto ${extract} not found....");
        items = book.jrl.asList([],silent: true, formatted: true);
      }
    }
    else {
      print("'${extract}' is empty we go with full journal!");
      items = book.jrl.asList([],silent: true, formatted: true);
    }
    String pageTitle = (extract.isEmpty)?S.of(context).JrlTitle: S.of(context).extract(extract);
    //TODO alternate cooring: https://api.flutter.dev/flutter/material/DataTable-class.html:w

    Map<String,TextEditingController> editors = {};
    List<String> labels = ["Datum","kto-","kto+","desc","cur","valuta","sum"]; //TODO internationalization here
    labels.forEach((key) { editors[key] = TextEditingController( ); });
    List<DataRow> rows = items.map((line)
    {
      return DataRow(
          cells: [
            DataCell(Text(line[0])), //date
            DataCell(Text((line.length >1)?"${line[1]}":"no data"), ), //kpl-
            DataCell(Text((line.length >2)?"${line[2]}":"no data")), //kpl+
            DataCell(Text((line.length >3)?"${line[3]}":"no data")), // desc
            DataCell(Text((line.length >4)?"${line[4]}":"no data")), //cur
            DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >5)?"${line[5]}":"no data"))), // valuta
            DataCell(Align(alignment: Alignment.centerRight, child:Text((line.length >6)?"${line[6]}":"no data"))), //sum
          ]);
    }).toList();
    rows.add(
        DataRow(
            cells: [
              for(int i =0; i< labels.length; i++) DataCell(Text( labels[i], )), //acount nnumber
            ])
    );
    rows.add(
        DataRow(
            cells: [
              for(int i =0; i< labels.length-1; i++)
                        DataCell(TextField( controller: editors[labels[i]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[i], ),)), //acount nnumber
                        DataCell(TextButton(
                          child: Text("add"),
                          onPressed: (()
                          {
                            print("pressed add ....");
                            //editors.forEach((key, value) { print("k: $key with ${value.text}");});
                            ref.read(bookProvider.notifier).addJrlLine(date: editors["Datum"]!.text,ktom: editors["kto-"]!.text,ktop: editors["kto+"]!.text, desc: editors["desc"]!.text, cur:editors["cur"]!.text, valuta:editors["valuta"]!.text,);
                          }),
                        )), //acc valuta
            ])
    );
    //rows.add(
    //    DataRow(
    //        cells: [
    //          DataCell(TextField( controller: editors[labels[0]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[0], ),)), //acount nnumber
    //          DataCell(TextField( controller: editors[labels[1]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[1], ), )),//acc desc
    //          DataCell(TextField( controller: editors[labels[2]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[2], ),)),//acc cur
    //          DataCell(TextField( controller: editors[labels[3]], decoration: InputDecoration( border: OutlineInputBorder(), labelText: labels[3], ), )), //acc budget
    //          DataCell(TextButton(
    //            child: Text("add"),
    //            onPressed: (()
    //            {
    //              print("pressed add ....");
    //              //editors.forEach((key, value) { print("k: $key with ${value.text}");});
    //              ref.read(bookProvider.notifier).addAccount(name: editors["kto nr"]!.text, desc: editors["desc"]!.text, cur:editors["cur"]!.text, budget:editors["budget"]!.text,);
    //            }),
    //          )), //acc valuta
    //        ])
    //);

    return  Center(
            child:
            SingleChildScrollView(
                child:
                //TODO think to switch to https://api.flutter.dev/flutter/material/PaginatedDataTable-class.html
                DataTable(
                    columns: [  DataColumn(label: Text("Datum")),DataColumn(label: Text("kto- ")),DataColumn(label: Text("kto+")), DataColumn(label: Text("desc")), DataColumn(label: Text("cur")), DataColumn(label: Text("valuta")), DataColumn(label: Text("sum"))],
                  rows: rows,
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
    );
  }

}