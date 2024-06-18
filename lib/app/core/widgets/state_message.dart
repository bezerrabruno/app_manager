import 'package:flutter/material.dart';

class StateMessage extends StatelessWidget {
  final String message;

  const StateMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: 28,
          color: colors.primary,
        ),
      ),
    );
  }
}
