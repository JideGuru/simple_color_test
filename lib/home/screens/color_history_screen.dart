import 'package:flutter/material.dart';

/// A screen that displays the history of background color changes.
class ColorHistoryScreen extends StatelessWidget {
  /// The list of colors representing the history of background color changes.
  final List<Color> colorHistory;

  /// Creates a new instance of the [ColorHistoryScreen] widget.
  ///
  /// The [colorHistory] parameter is required and represents the list of colors
  /// representing the history of background color changes.
  const ColorHistoryScreen({super.key, required this.colorHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color History'),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: colorHistory.isEmpty
            ? const Center(
                child: Text('Background color has not been changed yet'),
              )
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: colorHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  final color = colorHistory[index];

                  return ListTile(
                    tileColor: color,
                    title: Text(color.toString()),
                  );
                },
              ),
      ),
    );
  }
}
