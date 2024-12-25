// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alxgration_speedometer/speedometer.dart';
import 'package:pacer/constants.dart';
import 'package:pacer/widgets/speedometer.dart';

void main() {
  group('SpeedometerWidget Tests', () {
    const double testSpeed = 120.5;

    testWidgets('Test 5.1: Should render Speedometer widget correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      expect(find.byType(Speedometer), findsOneWidget);
    });

    testWidgets('Test 5.2: Should display correct current speed value',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.currentValue, testSpeed.toInt());
    });

    testWidgets('Test 5.3: Should have correct minimum value configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.minValue, 0);
    });

    testWidgets('Test 5.4: Should have correct maximum value configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.maxValue, 200);
    });

    testWidgets('Test 5.5: Should have correct pointer color configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.pointerColor, Colors.white);
    });

    testWidgets('Test 5.6: Should have correct bar color configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.barColor, AppColors.colorPrimaryDark);
    });

    testWidgets('Test 5.7: Should display correct speed unit text',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SpeedometerWidget(speed: testSpeed),
        ),
      ));

      final Speedometer speedometerWidget =
          tester.widget<Speedometer>(find.byType(Speedometer));
      expect(speedometerWidget.displayText, 'km/h');
    });
  });

  print('--> Speedometer Test Passed Successfully!');
}
