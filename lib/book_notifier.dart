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
    print("donw actacc");
  }

  void addJrlLine({required String date, required String ktom, required String ktop, required String desc, String? cur, required String valuta})
  {
    print("adding jrl line");
    if(cur == null || cur.isEmpty) cur = "EUR";
    if(valuta == null || valuta.isEmpty) valuta = "0";
    int valutaAsInt = 0;
    try {
      valutaAsInt = int.parse(valuta);
    }
    catch(e){
      //print("failed to convert $valuta to int");
    }
    JrlLine jrlLine = JrlLine(datum: date,kmin: ktom,kplu: ktop,desc: desc,cur: cur,valuta: valutaAsInt);
    state = state..jrl.add(jrlLine);
  }
}
