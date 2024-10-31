import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class SelectedBadge extends StatelessWidget {
  const SelectedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
      const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
      child: const Icon(
        Icons.check,
        color: AppColors.white,
      ),
    );
  }
}