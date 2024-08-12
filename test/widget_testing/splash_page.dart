import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/a_stateless_widget.dart';
import 'package:news_app/main_news_page.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/splash_page.dart';
import 'package:provider/provider.dart';

//NOTE: Widget testing in Flutter is a form of UI + white-box testing rather than unit testing. It typically provides slower feedback and requires significant effort to create and maintain.
void main() {
  testWidgets('date time labels are shown', (WidgetTester tester) async {
    // Build the SplashPage widget wrapped with the Provider.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsListProvider()),
        ],
        child: MaterialApp(home: SplashPage(title: '')),
      ),
    );

    // Get the display string from an element with a specific key.
    final element = find.byKey(Key('datetimeText'));
    expect(element, findsOneWidget);

    final textWidget = tester.widget<AStatelessWidget>(element);
    final displayString = textWidget.parsedString;
    print('Display string1: $displayString');
  });

  testWidgets('Navigates to HomePage', (WidgetTester tester) async {
    // Build the SplashPage widget wrapped with the Provider.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsListProvider()),
        ],
        child: MaterialApp(home: SplashPage(title: '')),
      ),
    );
    // Wait for the duration of the splash screen delay.
    // Wait until the Icons.add is present.
    await tester.pumpAndSettle(Duration(seconds: 6));
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Reorder'), findsOneWidget);
  });
}
