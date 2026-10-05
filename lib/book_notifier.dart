import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import 'rp_provider.dart';

/// The open book. Accounts and journal lines change the book in place, then
/// tell the listeners ([Ref.notifyListeners]).
class BookNotifier extends Notifier<Book>
{
  BookNotifier({this.initial});

  /// A book to start with (tests), else an empty one.
  final Book? initial;

  /// With a book's history open, its book; else [initial] or an empty one.
  @override
  Book build() => ref.watch(ledgerProvider.select((s) => s.ledger))?.book ?? initial ?? Book();

  /// After a change: notify, and record it when a history is open.
  void _changed() {
    ref.notifyListeners();
    ref.read(ledgerProvider.notifier).commit();
  }

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
    state.kpl.put(name, newOne);
    _changed();
  }

  void addJrlLine({required String date, required String ktom, required String ktop, required String desc, String? cur, required String valuta})
  {
    print("adding jrl line");
    if(cur == null || cur.isEmpty) cur = "EUR";
    // "12" is 12 €, "12,50" 12,50 € (nohfibu's Amount)
    final int valutaAsInt = Amount.parseCents(valuta) ?? 0;
    final DateTime dateO = FibuDate.parse(date) ?? DateTime.now();
    Konto minus = state.kpl.get(ktom)??Konto();
    Konto plus = state.kpl.get(ktop)??Konto();
    if(minus.isNotValid()) print("Konto $ktom minus not found....");
    if(plus.isNotValid()) print("Konto $ktom plus not found....");

    JrlLine jrlLine = JrlLine(datum: dateO ,kmin: minus,kplu: plus,desc: desc,cur: cur,valuta: valutaAsInt);
    state.jrl.add(jrlLine);
    _changed();
  }

  /// Adds journal lines made elsewhere (a stored operation) to the journal.
  void addLines(List<JrlLine> lines) {
    for (final line in lines) {
      state.jrl.add(line);
    }
    _changed();
  }
}
