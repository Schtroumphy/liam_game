import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: child,
    );
  }
}
