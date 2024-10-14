import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

class BookNotifier extends StateNotifier<Book>
{
  BookNotifier({Book? book}) : super(book ?? Book());

  void addAccount({required String name, required String desc, String? cur, String? budget})
  {
    if(cur == null || cur.isEmpty) cur = "EUR";
    if(budget == null || budget.isEmpty) budget = "0";
    int budgetAsInt = 0;
    try {
      budgetAsInt = int.parse(budget);
    }
    catch(e){
      //print("failed to convert $budget to int");
    }
    Konto newOne = Konto(name : name, desc:desc, plan: state.kpl,  cur: cur, budget: budgetAsInt );
    state = state..kpl.put(name,  newOne);
    Book bak = state;
      state = Book();
    state = bak;
  }

  void addJrlLine({required String date, required String ktom, required String ktop, required String desc, String? cur, required String valuta})
  {
    print("adding jrl line");
    if(cur == null || cur.isEmpty) cur = "EUR";
    if(valuta.isEmpty) valuta = "0";
    int valutaAsInt = 0;
    try {
      valutaAsInt = int.parse(valuta);
    }
    catch(e){
      //print("failed to convert $valuta to int");
    }
    DateTime dateO = DateTime.now();
    try {
      dateO = DateTime.parse(date);
    }
    catch(e){
      print("failed to parse Date $date");
    }
    Konto minus = state.kpl.get(ktom)??Konto();
    Konto plus = state.kpl.get(ktop)??Konto();
    if(minus.isNotValid()) print("Konto $ktom minus not found....");
    if(plus.isNotValid()) print("Konto $ktom plus not found....");

    JrlLine jrlLine = JrlLine(datum: dateO ,kmin: minus,kplu: plus,desc: desc,cur: cur,valuta: valutaAsInt);
    state = state..jrl.add(jrlLine);
    Book bak = state; //TODO look out why....
    state = Book();
    state = bak;
  }
}
