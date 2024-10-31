import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/shared_pref_service.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';

class AppHeader extends ConsumerWidget {
  const AppHeader({super.key, this.title, this.icon});

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerName = ref.read(sharedPrefServiceProvider).getStringPref('player_name');
    return AppPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ColoredBox(
              color: AppColors.white,
              child: AppText(
                title ?? 'Welcome back, $playerName 👋',
                style: context.textTheme.labelLarge?.copyWith(color: AppColors.primaryBlack, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Icon(icon ?? Icons.settings)
        ],
      ),
    );
  }
}
