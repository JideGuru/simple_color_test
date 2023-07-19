import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_color_test/home/screens/color_history_screen.dart';

/// Represents the first and only screen of the application.
class HomeScreen extends StatefulWidget {
  /// Creates a new instance of the [HomeScreen] widget.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _backgroundColor = Colors.white;
  final _colorHistory = <Color>[];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _backgroundColor = getRandomHexColor();
          });
          _colorHistory.add(_backgroundColor);
        },
        child: AnimatedContainer(
          width: screenSize.width,
          height: screenSize.height,
          color: _backgroundColor,
          duration: const Duration(milliseconds: 250),
          child: const Center(child: Text('Hello there')),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ColorHistoryScreen(
                colorHistory: _colorHistory,
              ),
            ),
          );
        },
        icon: const Icon(Icons.history),
        label: const Text('History'),
      ),
    );
  }

  Color getRandomHexColor() {
    final Random _random = Random();
    final color = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );

    return color;
  }
}
