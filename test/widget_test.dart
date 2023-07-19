import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_color_test/home/screens/color_history_screen.dart';
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

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle(); // allow animations to complete

    container = tester.widget(containerFinder);
    final newColor = (container.decoration as BoxDecoration?)?.color;
    expect(originalColor, isNot(equals(newColor)));
  });

  testWidgets('ColorHistoryScreen displays color history correctly',
      (WidgetTester tester) async {
    final List<Color> colorHistory = [Colors.red, Colors.green, Colors.blue];

    await tester.pumpWidget(
      MaterialApp(
        home: ColorHistoryScreen(colorHistory: colorHistory),
      ),
    );

    expect(find.text('Color History'), findsOneWidget);

    for (final color in colorHistory) {
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is ListTile) {
            final tile = widget;

            return tile.tileColor == color &&
                tile.title is Text &&
                (tile.title as Text?)?.data == color.toString();
          }

          return false;
        }),
        findsOneWidget,
      );
    }
  });

  testWidgets(
      'ColorHistoryScreen displays empty message when color history is empty',
      (WidgetTester tester) async {
    final List<Color> colorHistory = [];

    await tester.pumpWidget(
      MaterialApp(
        home: ColorHistoryScreen(colorHistory: colorHistory),
      ),
    );

    expect(
      find.text('Background color has not been changed yet'),
      findsOneWidget,
    );
  });
}
