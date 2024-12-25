// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pacer/helper/classes.dart';
import 'package:pacer/widgets/graphs.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  group('Graph Widget Tests', () {
    testWidgets('Test 4.1: DailyGraph renders with chart',
        (WidgetTester tester) async {
      final List<Hour> hourlyData = [
        Hour(hour: 1, steps: 100, calories: 50.0, distance: 1.0),
        Hour(hour: 2, steps: 200, calories: 75.0, distance: 2.0),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DailyGraph(hourlyList: hourlyData),
        ),
      ));

      expect(find.byType(SfCartesianChart), findsOneWidget);
      print('--> DailyGraph Chart Test Passed Successfully!');
    });

    testWidgets('Test 4.2: DailyGraph handles hourly data properly',
        (WidgetTester tester) async {
      final List<Hour> hourlyData = [
        Hour(hour: 1, steps: 100, calories: 50.0, distance: 1.0),
        Hour(hour: 2, steps: 200, calories: 75.0, distance: 2.0),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DailyGraph(hourlyList: hourlyData),
        ),
      ));

      final dailyGraphFinder = find.byType(DailyGraph);
      expect(dailyGraphFinder, findsOneWidget);
      print('--> DailyGraph Data Test Passed Successfully!');
    });

    testWidgets('Test 4.3: GraphWidget renders with chart',
        (WidgetTester tester) async {
      final List<DayData> weekData = [
        DayData(name: "Monday", steps: 1000, calories: 500, distance: 3.0),
        DayData(name: "Tuesday", steps: 1500, calories: 750, distance: 4.5),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GraphWidget(weekData, 'en'),
        ),
      ));

      expect(find.byType(SfCartesianChart), findsOneWidget);
      print('--> GraphWidget Chart Test Passed Successfully!');
    });

    testWidgets('Test 4.4: GraphWidget handles week data properly',
        (WidgetTester tester) async {
      final List<DayData> weekData = [
        DayData(name: "Monday", steps: 1000, calories: 500, distance: 3.0),
        DayData(name: "Tuesday", steps: 1500, calories: 750, distance: 4.5),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GraphWidget(weekData, 'en'),
        ),
      ));

      final graphWidgetFinder = find.byType(GraphWidget);
      expect(graphWidgetFinder, findsOneWidget);
      print('--> GraphWidget Data Test Passed Successfully!');
    });

    testWidgets('Test 4.5: GraphWidget language support test',
        (WidgetTester tester) async {
      final List<DayData> weekData = [
        DayData(name: "Monday", steps: 1000, calories: 500, distance: 3.0),
        DayData(name: "Tuesday", steps: 1500, calories: 750, distance: 4.5),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GraphWidget(weekData, 'en'),
        ),
      ));

      expect(find.text('Monday'), findsNothing);
      expect(find.text('1000'), findsNothing);
      print('--> GraphWidget Language Test Passed Successfully!');
    });
  });
}
