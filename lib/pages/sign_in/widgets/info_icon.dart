import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      icon: Icon(
        Icons.info_outline_rounded,
        color: AppColors.primaryBlack,
      ),
      onPressed: null,
    );
  }
}
