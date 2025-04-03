import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  const ChipText({
    super.key,
    required this.text,
    required this.title,
    this.textColor,
    this.titleColor,
  });

  final String text;
  final String title;
  final Color? textColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: titleColor),
        ),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: textColor),
        ),
      ],
    );
  }
}
