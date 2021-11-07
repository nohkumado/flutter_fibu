import 'package:flutter/material.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

import 'generated/l10n.dart';
import 'navdrawer.dart';

///the page that displays the journal or extract for a certain account
class JrlPage extends StatefulWidget {
  Book book = new Book();
  FibuSettings settings = FibuSettings();
  String extract = "";

  static const String routeName = "/jrl";
  JrlPage({Key? key, book, settings}) : super(key: key)
  {
    if(book != null) this.book = book;
    if(settings != null) this.settings = settings;
  }


  @override
  State<JrlPage> createState() => _JrlPageState();
}

class _JrlPageState extends State<JrlPage> {

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null)
    {
      final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      if(args != null)
      {
        widget.book = args.book;
        widget.settings = args.settings;
        widget.extract = args.extract;
      }
      ;
    }
    //print("in KPL book is : ${widget.book}");
    late List items;

    if(widget.extract.isNotEmpty)
    {
      Konto? extK = widget.book.kpl.get(widget.extract);
      if(extK !=null)
      {
        if(extK.extract == null ) {
          widget.book.jrl.execute();
        } else
          {
            if(extK.extract.count() <= 0)
              {
               widget.book.jrl.execute();
               //TODO check if this node is empty but has chikldren in that case we should aggreagte all sub nodes
              }
          }
        items = extK.extract.asList([],silent: true, formatted: true);

      }
      else {
        print("#### Error kto ${widget.extract} not found....");
        items = widget.book.jrl.asList([],silent: true, formatted: true);
      }
    }
    else {
      print("${widget.extract}i is empty we go with std journal!");
      items = widget.book.jrl.asList([],silent: true, formatted: true);
    }
    String pageTitle = (widget.extract.isEmpty)?S.of(context).JrlTitle: S.of(context).extract(widget.extract);
    //TODO alternate cooring: https://api.flutter.dev/flutter/material/DataTable-class.html:w

    return Scaffold(
        drawer: NavDrawer(book: widget.book, settings: widget.settings),
        appBar: AppBar( title: Text(pageTitle) ),
        body: Center(
            child:
            SingleChildScrollView(
                child:
                    //TODO think to switch to https://api.flutter.dev/flutter/material/PaginatedDataTable-class.html
                DataTable(
                    columns: [  DataColumn(label: Text("Datum")),DataColumn(label: Text("kto- ")),DataColumn(label: Text("kto+")), DataColumn(label: Text("desc")), DataColumn(label: Text("cur")), DataColumn(label: Text("valuta")), DataColumn(label: Text("sum"))],
                    rows: items.map((line)
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
