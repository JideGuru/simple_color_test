import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_color_test/home/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen has a Text widget with "Hello there"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    final textFinder = find.text('Hello there');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Tapping screen changes the color', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    final textFinder = find.text('Hello there');
    final containerFinder = find.ancestor(
      of: textFinder,
      matching: find.byType(AnimatedContainer),
    );

    AnimatedContainer container = tester.widget(containerFinder);
    final originalColor = (container.decoration as BoxDecoration?)?.color;

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle(); // allow animations to complete

    container = tester.widget(containerFinder);
    final newColor = (container.decoration as BoxDecoration?)?.color;

    expect(originalColor, isNot(equals(newColor)));
  });
}
