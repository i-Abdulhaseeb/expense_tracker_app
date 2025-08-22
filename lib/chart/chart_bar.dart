import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({required this.fill, super.key});
  final double fill;
  @override
  Widget build(context) {
    final isDARKMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: isDARKMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
