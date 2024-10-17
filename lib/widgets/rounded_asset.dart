import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class RoundedAsset extends StatelessWidget {
  const RoundedAsset({super.key, required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.orange.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Image.asset(
            assetPath,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
