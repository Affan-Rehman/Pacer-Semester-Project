// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:pacer/widgets/dialog.dart';

void main() {
  group('Dialog Integration Tests', () {
    late MockFirebaseAuth mockAuth;
    late MockGoogleSignIn mockGoogleSignIn;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockGoogleSignIn = MockGoogleSignIn();
    });

    testWidgets('Integration Test 1.1: NoLoginDialog text content verification',
        (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(MaterialApp(
        home: NoLoginDialog(onPressed: () {
          pressed = true;
        }),
      ));

      expect(find.text('Login'), findsAtLeast(2));
      expect(find.text('You are not logged in. Kindly login to save data.'),
          findsOneWidget);
    });

    testWidgets(
        'Integration Test 1.2: NoLoginDialog button interaction functionality',
        (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(MaterialApp(
        home: NoLoginDialog(onPressed: () {
          pressed = true;
        }),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets('Integration Test 1.3: LoginDialog header verification',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginDialog(),
      ));

      expect(find.text('My Profile'), findsOneWidget);
    });

    testWidgets('Integration Test 1.4: LoginDialog sign-in button interaction',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginDialog(),
      ));

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();
    });
  });

  print('--> Integration Test Passed Successfully!');
}
