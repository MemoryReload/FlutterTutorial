// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:com_test_flutter_transaction/main.dart';

void main() {
  testWidgets('App starts and displays title and initial message',
      (WidgetTester tester) async {
    // Set a specific screen size to avoid layout errors in the test environment.
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed.
    expect(find.text('Personal Expenses'), findsOneWidget);

    // Verify that the initial message for no transactions is shown.
    expect(find.text('No transactions added yet!'), findsOneWidget);
  });
}
