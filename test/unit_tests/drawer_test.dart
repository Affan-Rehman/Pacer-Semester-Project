// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pacer/widgets/drawer.dart';

void main() {
  group('Navigation Drawer Tests', () {
    late Widget testWidget;

    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return MyNavigationDrawer("en", 0);
            },
          ),
        ),
      );
    });

    testWidgets('Test 3.1: More Apps button exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('More Apps'), findsOneWidget);
      print('--> More Apps Test Passed Successfully!');
    });

    testWidgets('Test 3.2: Share App button exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Share App'), findsOneWidget);
      print('--> Share App Test Passed Successfully!');
    });

    testWidgets('Test 3.3: Feedback button exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Feedback'), findsOneWidget);
      print('--> Feedback Test Passed Successfully!');
    });

    testWidgets('Test 3.4: Privacy Policy button exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
      print('--> Privacy Policy Test Passed Successfully!');
    });

    testWidgets('Test 3.5: Help button exists', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Help'), findsOneWidget);
      print('--> Help Test Passed Successfully!');
    });
  });
}
