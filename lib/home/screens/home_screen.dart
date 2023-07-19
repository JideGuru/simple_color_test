import 'dart:math';

import 'package:flutter/material.dart';

/// Represents the first and only screen of the application.
class HomeScreen extends StatefulWidget {
  /// Creates a new instance of the [HomeScreen] widget.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            backgroundColor = getRandomHexColor();
          });
        },
        child: AnimatedContainer(
          width: screenSize.width,
          height: screenSize.height,
          color: backgroundColor,
          duration: const Duration(milliseconds: 250),
          child: const Center(child: Text('Hello there')),
        ),
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
