import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ColoredBox(
            color: AppColors.white,
            child: AppText(
              'Welcome back, Axel 👋',
              style: context.textTheme.labelLarge?.copyWith(color: AppColors.primaryBlack, fontWeight: FontWeight.normal),
            ),
          ),
          const Icon(Icons.settings)
        ],
      ),
    );
  }
}
