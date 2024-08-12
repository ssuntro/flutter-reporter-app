import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Smoke test, Add news flow', (WidgetTester tester) async {
    app.main();

    // await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(Duration(seconds: 6));

    // remember number of news before adding new news
    // final listTileCountB4 = find.byType(ListTile).evaluate().length;
    // print('Number of ListTile widgets: $listTileCountB4');
    // Ensure the ReorderableListView is present
    final reorderableListViewFinder = find.byType(ReorderableListView);
    expect(reorderableListViewFinder, findsOneWidget);

    // Get the number of children
    final reorderableListView =
        tester.widget<ReorderableListView>(reorderableListViewFinder);
    final listTileCountB4 = reorderableListView.itemCount;

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(Duration(seconds: 1));

    expect(find.text('Add news'), findsOneWidget);

    // click "Add" button
    await tester.tap(find.text("Add"));
    await tester.pumpAndSettle();

    //check number of item in ListTile +1
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.pump();

    final reorderableListViewFinderAfter = find.byType(ReorderableListView);
    expect(reorderableListViewFinderAfter, findsOneWidget);
    final reorderableListViewAfter =
        tester.widget<ReorderableListView>(reorderableListViewFinderAfter);
    final listTileCountfter = reorderableListViewAfter.itemCount;
    expect(listTileCountfter, listTileCountB4 + 1);
  });

  // testWidgets('smoke test, Read news', (WidgetTester tester) async {
  //   app.main();
  //   // await tester.tap(find.byIcon(Icons.add));
  //   await tester.pumpAndSettle(Duration(seconds: 6));

  //   // Tap on the first news item
  //   await tester.tap(find.byType(ListTile).first);
  //   await tester.pumpAndSettle();
  // });
}
