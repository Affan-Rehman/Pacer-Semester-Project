// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pacer/widgets/weather_widget.dart';

void main() {
  group('WeatherWidget Tests', () {
    testWidgets('Test 6.1: Should display default temperature placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: WeatherWidget(currentLanguage: 'en'),
      ));

      await tester.pump(Duration.zero);

      expect(find.text('--°C'), findsOneWidget);
    });

    testWidgets('Test 6.2: Should not display sun icon initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: WeatherWidget(currentLanguage: 'en'),
      ));

      await tester.pump(Duration.zero);

      expect(find.byIcon(Icons.wb_sunny), findsNothing);
    });
  });

  print('--> Weather Widget Test Passed Successfully!');
}
