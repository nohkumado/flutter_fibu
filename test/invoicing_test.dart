import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fibu/generated/l10n.dart';
import 'package:flutter_fibu/invoicing/invoice_files.dart';
import 'package:flutter_fibu/invoicing/invoice_notifier.dart';
import 'package:flutter_fibu/invoicing/invoices_page.dart';
import 'package:flutter_fibu/invoicing/letterheads_page.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nohfibu/nohfibu.dart';

void main() {
  late Directory dir;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('invoicing');
    const Letterhead(id: 'micro', name: 'Jean Exemple', tax: TaxProfile(country: 'FR', regime: 'franchise'))
        .save(Directory('${dir.path}/letterheads'));
    InvoiceStore(customers: {
      'assoc': const Customer(id: 'assoc', name: 'Association Exemple', country: 'FR', business: true),
    }).save(File('${dir.path}/factures.json'));
  });
  tearDown(() => dir.deleteSync(recursive: true));

  testWidgets('offer → issued → accepted → invoice → paid, all in the app', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    addTearDown(tester.view.resetPhysicalSize);
    final container = ProviderContainer(overrides: [
      invoiceProvider.overrideWith(() => InvoiceNotifier(files: InvoiceFiles(dir))),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: [Locale('en'), Locale('de'), Locale('fr')],
        home: Scaffold(body: InvoicesPage()),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text('No offers or invoices yet.'), findsOneWidget);

    // write the offer
    await tester.tap(find.text('New offer'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Customer'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Association Exemple').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'Description'), 'Stage, 4 séances');
    await tester.enterText(find.widgetWithText(TextField, 'Unit price (net)'), '240');
    await tester.pumpAndSettle();
    expect(find.textContaining('293 B'), findsOneWidget, reason: 'franchise: the note shows while writing');
    await tester.tap(find.text('Issue'));
    await tester.pumpAndSettle();

    // the offer page: issued, then accepted, then its invoice
    expect(find.text('Offers D${DateTime.now().year}-0001'), findsOneWidget);
    await tester.tap(find.text('Accepted'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Make the invoice'));
    await tester.pumpAndSettle();
    expect(find.text('Invoices ${DateTime.now().year}-0001'), findsOneWidget);

    await tester.tap(find.text('Payment received'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TextField, 'Amount'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    final store = InvoiceStore.load(File('${dir.path}/factures.json'));
    final invoice = store.find('${DateTime.now().year}-0001', kind: InvoiceKind.invoice)!;
    expect(invoice.status(), InvoiceStatus.paid);
    expect(invoice.source, 'D${DateTime.now().year}-0001');
    expect(store.find('D${DateTime.now().year}-0001')!.status(), InvoiceStatus.invoiced);
  });

  testWidgets('a letterhead made in the settings is the YAML the command line reads', (tester) async {
    tester.view.physicalSize = const Size(1200, 4000);
    addTearDown(tester.view.resetPhysicalSize);
    final container = ProviderContainer(overrides: [
      invoiceProvider.overrideWith(() => InvoiceNotifier(files: InvoiceFiles(dir))),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: [Locale('en'), Locale('de'), Locale('fr')],
        home: LetterheadsPage(),
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextFormField, 'Short id'), 'ei');
    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'Atelier 3D');
    await tester.tap(find.text('Charges VAT'));
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextFormField, 'Reverse charge for (categories)'), '3dprint');
    final receivable = find.widgetWithText(TextFormField, 'Receivable');
    await tester.scrollUntilVisible(receivable, 300, scrollable: find.byType(Scrollable).first);
    await tester.enterText(receivable, '411');
    await tester.enterText(find.widgetWithText(TextFormField, 'Revenue'), '706');
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle();

    expect(find.text('Atelier 3D'), findsOneWidget);
    final lh = Letterhead.load(File('${dir.path}/letterheads/ei.yaml'));
    expect(lh.tax.regime, 'vat');
    expect(lh.tax.rate, 0.2);
    expect(lh.tax.reverseChargeFor('3dprint'), isTrue);
    expect(lh.books, isTrue);
  });
}

