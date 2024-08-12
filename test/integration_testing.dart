import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Smoke test, Add news flow', (WidgetTester tester) async {
    app.main();
    // Wit until Splash screen is gone
    await tester.pumpAndSettle(Duration(seconds: 6));

    // remember number of news before adding new news
    expect(find.byType(ReorderableListView), findsOneWidget);
    final listTileCountB4 = tester
        .widget<ReorderableListView>(find.byType(ReorderableListView))
        .itemCount;

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(Duration(seconds: 1));

    //verify that we are on AddNewsPage
    expect(find.text('Add news'), findsOneWidget);

    // click "Add" button
    await tester.tap(find.text("Add"));
    await tester.pumpAndSettle();

    //check number of item in increasing by 1
    expect(find.byType(ReorderableListView), findsOneWidget);
    final listTileCountAfter = tester
        .widget<ReorderableListView>(find.byType(ReorderableListView))
        .itemCount;
    expect(listTileCountAfter, listTileCountB4 + 1);
  });

  testWidgets('smoke test, Read news', (WidgetTester tester) async {
    app.main();
    //   // await tester.tap(find.byIcon(Icons.add));
    //   await tester.pumpAndSettle(Duration(seconds: 6));

    //   // Tap on the first news item
    //   await tester.tap(find.byType(ListTile).first);
    //   await tester.pumpAndSettle();
  });
}
