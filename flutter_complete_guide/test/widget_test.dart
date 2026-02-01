// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_complete_guide/main.dart';

void main() {
  testWidgets('Quiz starts and displays first question', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the first question is displayed.
    expect(find.text('What\'s your favourite color?'), findsOneWidget);

    // Verify that the answers for the first question are displayed.
    expect(find.text('Answer 1'), findsOneWidget);
    expect(find.text('Answer 2'), findsOneWidget);
    expect(find.text('Answer 3'), findsOneWidget);
  });
}
