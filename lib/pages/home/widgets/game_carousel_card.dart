import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/home/model/game.dart';
import 'package:liam_game/pages/home/widgets/carousel_navigation_button.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';

class GameCarouselCard extends StatelessWidget {
  const GameCarouselCard({super.key, this.onNextClick, this.onPreviousClick, required this.isFirst, required this.game, required this.isLast});

  final Game game;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onNextClick;
  final VoidCallback? onPreviousClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(color: game.isAvailable ? AppColors.orange : AppColors.grey, borderRadius: BorderRadius.circular(25)),
            child: AppPadding(
              child: Column(
                children: [
                  Image.asset(
                    game.imagePath ?? 'assets/images.pencil.png'.hardcoded,
                    width: 60,
                    height: 60,
                  ),
                  AppText(
                    game.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      child: Container(
                        height: 2,
                        width: 100,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: AppText(
                      game.description ?? '',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isFirst)
          CarouselNavigationButton(
            iconData: Icons.arrow_back_ios_new,
            onClick: onPreviousClick,
            alignment: Alignment.centerLeft,
          ),
        if (!isLast)CarouselNavigationButton(
          iconData: Icons.arrow_forward_ios,
          onClick: onNextClick,
        )
      ],
    );
  }
}
