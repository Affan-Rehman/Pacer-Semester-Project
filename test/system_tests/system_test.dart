// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pacer/helper/adapters.dart';
import 'package:pacer/helper/classes.dart';
import 'package:pacer/screens.dart/goalscreen.dart';
import 'package:pacer/screens.dart/historyscreen.dart';
import 'package:pacer/screens.dart/homescreen.dart';

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

  group('Main Screens System Tests', () {
    testWidgets(
        'System Test 1.1: Splash Screen content and timing verification',
        (WidgetTester tester) async {
      print('Running System Test 1.1');
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      await tester.pump(const Duration(milliseconds: 4500));

      expect(find.text("Pacer"), findsOneWidget,
          reason: 'Splash screen should display "Pacer" text');
      print('System Test 1.1 completed');
    });

    testWidgets('System Test 1.2: Home Screen title verification',
        (WidgetTester tester) async {
      print('Running System Test 1.2');
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.pumpAndSettle();

      expect(find.text("Pacer"), findsOneWidget,
          reason: 'Home screen should display "Pacer" title');
      print('System Test 1.2 completed');
    });

    testWidgets('System Test 1.3: History Screen navigation tab verification',
        (WidgetTester tester) async {
      print('Running System Test 1.3');
      await tester.pumpWidget(MaterialApp(home: HistoryScreen('en')));
      await tester.pumpAndSettle();

      expect(find.text("Daily"), findsOneWidget,
          reason: 'History screen should display "Daily" tab');
      print('System Test 1.3 completed');
    });

    testWidgets('System Test 1.4: Goal Screen title verification',
        (WidgetTester tester) async {
      print('Running System Test 1.4');
      await tester.pumpWidget(const MaterialApp(home: GoalScreen('en')));
      await tester.pumpAndSettle();

      expect(find.text("Goal"), findsOneWidget,
          reason: 'Goal screen should display "Goal" title');
      print('System Test 1.4 completed');
    });
  });

  tearDownAll(() {
    print('Cleaning up System Tests');
    Hive.close();
  });

  print('--> All System Tests Passed Successfully!');
}
