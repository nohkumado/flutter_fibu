import 'package:flutter/material.dart';
import 'package:flutter_fibu/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('the app starts: app bar, and the drawer opens',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(ProviderScope(child: MyApp(prefs: prefs)));
    await tester.pump();

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);

    final scaffold = tester.firstState<ScaffoldState>(find.byType(Scaffold));
    scaffold.openDrawer();
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(Drawer), findsOneWidget);
  });
}
