import 'package:flutter/material.dart';
import 'package:simple_color_test/home/screens/home_screen.dart';

/// Represents the root widget of the application.
///
/// This is a stateless widget that includes the [MaterialApp] with
/// a given title, color scheme and the home screen of the application.
class App extends StatelessWidget {
  /// Creates a new instance of the [App] widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
