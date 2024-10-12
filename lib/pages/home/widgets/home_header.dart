import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.title, this.icon});

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ColoredBox(
            color: AppColors.white,
            child: AppText(
              title ?? 'Welcome back, Axel 👋',
              style: context.textTheme.labelLarge?.copyWith(color: AppColors.primaryBlack, fontWeight: FontWeight.normal),
            ),
          ),
          Icon(icon ?? Icons.settings)
        ],
      ),
    );
  }
}
