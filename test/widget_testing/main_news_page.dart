import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/main_news_page.dart';
import 'package:news_app/news_category.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/news_status.dart';
import 'package:news_app/news_tile.dart';
import 'package:provider/provider.dart';

//NOTE: Widget testing in Flutter is a form of UI + white-box testing rather than unit testing. It typically provides slower feedback and requires significant effort to create and maintain.
void main() {
  testWidgets('navigate to Add news page', (WidgetTester tester) async {
    // Build the SplashPage
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsListProvider()),
        ],
        child: MaterialApp(home: MainNewsPage()),
      ),
    );

    // Wait until the Icons.add is present.
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Add news'), findsOneWidget);
  });

  //TODO: need to fix this test by mocking the NewsListProvider or network layer
  // testWidgets('navigate to News page', (WidgetTester tester) async {
  //   // Build the SplashPage
  //   await tester.pumpWidget(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(create: (_) => NewsListProvider()),
  //       ],
  //       child: MaterialApp(home: MainNewsPage()),
  //     ),
  //   );

  //   // Ensure initState has been called and the widget is updated
  //   await tester.pumpAndSettle(Duration(seconds: 1));

  //   // Tap on the first news item
  //   await tester.tap(find.byType(NewsTile).first);
  //   await tester.pumpAndSettle();

  //   // Verify that the News page is displayed
  //   final element = find.byKey(Key('news-title'));
  //   expect(element, findsOneWidget);
  // });

  testWidgets('Wait until first item of NewsTile is present',
      (WidgetTester tester) async {
    // Pump the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NewsTile(
            title: 'News 1',
            category: NewsCategory.animal,
            status: NewsStatus.closed,
            color: Colors.black,
            onDidClick: (String) {},
          ),
        ),
      ),
    );

    // Wait until the first NewsTile is present
    await tester.pumpAndSettle();

    // Verify the first NewsTile is present
    expect(find.text('News 1'), findsOneWidget);
  });
}
