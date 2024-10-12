import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/theme/colors.dart';

class InkPanel extends StatelessWidget {
  const InkPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.orange),
      ),
      child: Center(child: Text("Begin writing ...".hardcoded)),
    );
  }
}
