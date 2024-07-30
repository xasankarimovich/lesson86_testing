import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson86_testing/main.dart';

void main() {
  group("Calculator TEST", () {
    testWidgets("Calculatorni textfield va buttonlar ishlashini tekshirish",
        (widgetTester) async {
      // MainApp vidjetini yaratadi
      await widgetTester.pumpWidget(const MainApp());

      Finder aTextField = find.byKey(const ValueKey("a"));
      Finder bTextField = find.byKey(const ValueKey("b"));

      // expect(aTextField, findsOneWidget);
      // expect(bTextField, findsOneWidget);

      await widgetTester.enterText(aTextField, "5");
      await widgetTester.enterText(bTextField, "10");

      // Qayta build qiladi
      await widgetTester.pumpAndSettle();

      // expect(find.text("5"), findsOneWidget);
      // expect(find.text("10"), findsOneWidget);

      // Knopkani bosib tekshirib ko'ramiz
      Finder plusButton = find.byKey(const ValueKey("+"));
      expect(plusButton, findsOneWidget);

      // tab - knopkani bosamiz
      await widgetTester.tap(plusButton);

      // Qayta build qiladi
      await widgetTester.pumpAndSettle();

      expect(find.text("Result: 15"), findsOneWidget);
    });
  });
}
