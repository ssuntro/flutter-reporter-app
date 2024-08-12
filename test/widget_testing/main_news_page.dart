import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/main_news_page.dart';
import 'package:news_app/news_list.dart';
import 'package:provider/provider.dart';

//NOTE: Widget testing in Flutter is a form of UI + white-box testing rather than unit testing. It typically provides slower feedback and requires significant effort to create and maintain.
void main() {
  testWidgets('navigate to Add news page', (WidgetTester tester) async {
    // Build the SplashPage widget wrapped with the Provider.
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
}
