import 'package:flutter/material.dart';

class AppFlex extends StatelessWidget {
  const AppFlex(this.flex, {super.key});

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Spacer(flex: flex);
  }
}
