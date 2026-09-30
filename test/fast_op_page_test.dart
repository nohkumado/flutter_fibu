import 'package:flutter/material.dart';
import 'package:flutter_fibu/book_notifier.dart';
import 'package:flutter_fibu/fast_op_page.dart';
import 'package:flutter_fibu/generated/l10n.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nohfibu/nohfibu.dart';

/// A book with three accounts and one stored operation: pay from the cash
/// box into the transit account, then book the purchase from it.
Book sampleBook() {
  final book = Book();
  for (final (name, desc) in [("1001", "Caisse"), ("1999", "Transit"), ("3500", "Equipement")]) {
    book.kpl.put(name, Konto(name: name, desc: desc, plan: book.kpl));
  }
  book.ops["SHOP"] = Operation(book, name: "SHOP")
    ..add(cminus: "1001", cplus: "1999", desc: "Courses", valuta: "#payement")
    ..add(cminus: "1999", cplus: "3500", desc: "Materiel #objet", valuta: "(#payement)");
  return book;
}

void main() {
  testWidgets('choose the op, answer, check the preview, book it', (tester) async {
    final book = sampleBook();
    final container = ProviderContainer(overrides: [
      bookProvider.overrideWith(() => BookNotifier(initial: book)),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: [Locale('en'), Locale('de')],
        home: Scaffold(body: FastOpPage()),
      ),
    ));

    await tester.tap(find.text('Choose an operation'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SHOP').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextField, 'payement'), '12,50');
    await tester.enterText(find.widgetWithText(TextField, 'objet'), 'sabre');
    await tester.pumpAndSettle();
    expect(find.textContaining('Materiel sabre'), findsOneWidget);

    final before = book.jrl.count();
    await tester.tap(find.text('Book'));
    await tester.pumpAndSettle();
    expect(book.jrl.count(), before + 2);
    expect(find.text('2 lines booked'), findsOneWidget);
  });
}
