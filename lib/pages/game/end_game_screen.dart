import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/application/game_manager.dart';
import 'package:liam_game/pages/home/home_screen.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';

class EndGameScreen extends ConsumerWidget {
  const EndGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final score = ref.read(gameManagerNotifierProvider).score;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/end_game.png'.hardcoded),
              fit: BoxFit.fitWidth,
              alignment: AlignmentDirectional.topStart,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText('Game is over ...'.hardcoded, style: context.textTheme.labelLarge,),
                const SizedBox(height: 12,),
                AppText('Congratulations.\nYou win $score points !'.hardcoded, style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.primaryBlack,
                ),),
                SizedBox(height: size.height * 0.05,),
                ButtonIcon(
                  label: 'Go back',
                  backgroundColor: AppColors.yellow,
                  foregroundColor: AppColors.primaryBlack,
                  child: const Icon(Icons.arrow_forward_ios),
                  onClick: () => _goToHomePage(context),
                ),
                SizedBox(height: size.height * 0.2,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToHomePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen())
    );
  }
}
