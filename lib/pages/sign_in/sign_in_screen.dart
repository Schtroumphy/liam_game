import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/onboarding/onboarding_screen.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_image.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';
import 'package:liam_game/pages/sign_in/widgets/info_icon.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              AppImage('assets/images/home_line.png'.hardcoded),
              const Positioned(top: 8, right: 8, child: InfoIcon()),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 5),
                    AppImage('assets/images/logo_liam.png'.hardcoded),
                    AppText('Learning using AI'.hardcoded),
                    const Spacer(flex: 2),
                    TextButton(onPressed: () {}, child: Text('Jouer anonymement'.hardcoded)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Container(
                        height: 1,
                        width: 100,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    ButtonIcon(
                      label: 'Connexion with Google'.hardcoded,
                      imagePath: 'assets/icons/google_icon.png'.hardcoded,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
                        //Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomeScreen())); // TODO Uncomment
                      },
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

