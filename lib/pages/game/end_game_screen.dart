import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/home/home_screen.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';

class EndGameScreen extends StatelessWidget {
  const EndGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
                AppText('Congratulations.\nYou win 260 points !'.hardcoded, style: context.textTheme.labelMedium?.copyWith(
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
