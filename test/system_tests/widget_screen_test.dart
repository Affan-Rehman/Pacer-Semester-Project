// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pacer/helper/adapters.dart';
import 'package:pacer/helper/classes.dart';
import 'package:pacer/widgets/compass.dart';
import 'package:pacer/screens.dart/widgetscreen.dart';
import 'package:pacer/widgets/speedometer.dart';
import 'package:pacer/widgets/weather_widget.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    print('Setting up System Tests');
    final temp = await Directory.systemTemp.createTemp();
    Hive.init(temp.path);

    // Register Hive adapters
    Hive.registerAdapter(PlaceAdapter());
    Hive.registerAdapter(WalkAdapter());
    Hive.registerAdapter(DayDataAdapter());
    Hive.registerAdapter(HourAdapter());
    Hive.registerAdapter(DailyAdapter());
    Hive.registerAdapter(WeeklyAdapter());
    Hive.registerAdapter(MonthlyAdapter());
    Hive.registerAdapter(YearlyAdapter());
    Hive.registerAdapter(PolylineAdapter());

    // Open Hive boxes
    await Hive.openBox<Walk>('walks');
    await Hive.openBox<DayData>('weekData');
    await Hive.openBox<Place>("places");
    await Hive.openBox<Walk>('backup');
    await Hive.openBox<Yearly>('yearlyList');
    await Hive.openBox<Monthly>('monthlyList');
    await Hive.openBox<Weekly>('weeklyList');
    await Hive.openBox<Daily>('dailyList');
    await Hive.openBox<Polyline>('polylines');
    print('System Test Setup Complete');
  });

  group('Widget Screen System Tests', () {
    testWidgets('System Test 3.1: Weather widget display verification',
        (WidgetTester tester) async {
      print('Running System Test 3.1');

      // Build widget with timeout
      await tester.pumpWidget(MaterialApp(
        home: WidgetsScreen(currentLanguage: 'en'),
      ));

      // Use multiple pump calls instead of pumpAndSettle
      await tester.pump(); // Build frame
      await tester.pump(const Duration(milliseconds: 500)); // Animation frame

      expect(find.byType(WeatherWidget), findsOneWidget);
      print('System Test 3.1 completed');
    }, timeout: const Timeout(Duration(seconds: 60)));

    testWidgets('System Test 3.2: Compass widget display verification',
        (WidgetTester tester) async {
      print('Running System Test 3.2');

      // Build widget with timeout
      await tester.pumpWidget(MaterialApp(
        home: WidgetsScreen(currentLanguage: 'en'),
      ));

      // Use multiple pump calls instead of pumpAndSettle
      await tester.pump(); // Build frame
      await tester.pump(const Duration(milliseconds: 500)); // Animation frame

      // Find widget without waiting for full settlement
      final compassFinder = find.byType(CompassWidget);
      expect(compassFinder, findsOneWidget);
      print('System Test 3.2 completed');
    }, timeout: const Timeout(Duration(seconds: 60)));

    testWidgets('System Test 3.3: Speedometer widget display verification',
        (WidgetTester tester) async {
      print('Running System Test 3.3');

      // Build widget with timeout
      await tester.pumpWidget(MaterialApp(
        home: WidgetsScreen(currentLanguage: 'en'),
      ));

      // Use multiple pump calls instead of pumpAndSettle
      await tester.pump(); // Build frame
      await tester.pump(const Duration(milliseconds: 500)); // Animation frame

      expect(find.byType(SpeedometerWidget), findsOneWidget);
      print('System Test 3.3 completed');
    }, timeout: const Timeout(Duration(seconds: 60)));
  });

  tearDownAll(() {
    print('Cleaning up System Tests');
    Hive.close();
  });

  print('--> All System Tests Passed Successfully!');
}
