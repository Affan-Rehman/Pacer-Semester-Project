// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pacer/helper/adapters.dart';
import 'package:pacer/helper/classes.dart';
import 'package:pacer/screens.dart/wateractivity.dart';
import 'package:pacer/widgets/drawable_glass.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    print('Setting up System Tests');
    final temp = await Directory.systemTemp.createTemp();
    Hive.init(temp.path);

    // Register all adapters
    Hive.registerAdapter(PlaceAdapter());
    Hive.registerAdapter(WalkAdapter());
    Hive.registerAdapter(DayDataAdapter());
    Hive.registerAdapter(HourAdapter());
    Hive.registerAdapter(DailyAdapter());
    Hive.registerAdapter(WeeklyAdapter());
    Hive.registerAdapter(MonthlyAdapter());
    Hive.registerAdapter(YearlyAdapter());
    Hive.registerAdapter(PolylineAdapter());

    // Open all required Hive boxes
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

  group('Water Activity System Tests', () {
    testWidgets('System Test 2.1: WaterActivity title display',
        (WidgetTester tester) async {
      print('Running System Test 2.1');
      await tester.pumpWidget(MaterialApp(
        home: WaterActivity(),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Water'), findsOneWidget);
      print('System Test 2.1 completed');
    });

    testWidgets('System Test 2.2: Initial water consumption display',
        (WidgetTester tester) async {
      print('Running System Test 2.2');
      await tester.pumpWidget(MaterialApp(
        home: WaterActivity(),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Water Drank: 0 glasses'), findsOneWidget);
      print('System Test 2.2 completed');
    });

    testWidgets('System Test 2.3: Draggable glass widget verification',
        (WidgetTester tester) async {
      print('Running System Test 2.3');
      await tester.pumpWidget(MaterialApp(
        home: WaterActivity(),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(DraggableGlass), findsOneWidget);
      print('System Test 2.3 completed');
    });

    testWidgets('System Test 2.4: Drag target widget verification',
        (WidgetTester tester) async {
      print('Running System Test 2.4');
      await tester.pumpWidget(MaterialApp(
        home: WaterActivity(),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(DragTarget), findsOneWidget);
      print('System Test 2.4 completed');
    });
  });

  tearDownAll(() {
    print('Cleaning up System Tests');
    Hive.close();
  });

  print('--> All System Tests Passed Successfully!');
}
