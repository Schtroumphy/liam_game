import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class CarouselNavigationButton extends StatelessWidget {
  const CarouselNavigationButton({super.key, this.onClick, this.iconData, this.alignment});

  final VoidCallback? onClick;
  final IconData? iconData;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: alignment ?? Alignment.centerRight,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: AppColors.white,
            shape: const CircleBorder(side: BorderSide(width: 2, color: AppColors.lightOrange)),
            padding: const EdgeInsets.all(12),
            shadowColor: AppColors.primaryBlack,
          ),
          child: Icon(iconData ?? Icons.arrow_forward_ios, color: AppColors.primaryBlack),
        ),
      ),
    );
  }
}
