import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: style ?? theme.textTheme.titleMedium,
    );
  }
}
