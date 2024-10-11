
import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class TextChip extends StatelessWidget {
  const TextChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(
      color: AppColors.white
    );
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        label: Text(label, style: style,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppColors.primaryBlack,
      ),
    );
  }
}
