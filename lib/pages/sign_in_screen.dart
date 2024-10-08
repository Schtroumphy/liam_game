import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liam_game/extensions/string_extensions.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/theme/theme.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: kDebugMode,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                HomeImage('assets/images/home_line.png'.hardcoded),
                const Positioned(top: 8, right: 8, child: InfoIcon()),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 5),
                      HomeImage('assets/images/logo_liam.png'.hardcoded),
                      HomeText('Learning using AI'.hardcoded),
                      const Spacer(flex: 2),
                      TextButton(onPressed: (){}, child: Text('Jouer anonymement'.hardcoded)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                          height: 1,
                          width: 100,
                          color: AppColors.primaryBlack,
                        ),
                      ),
                      const ConnexionButton(),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeImage extends StatelessWidget {
  const HomeImage(this.asset, {super.key});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: BoxFit.fill,
    );
  }
}

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

class HomeText extends StatelessWidget {
  const HomeText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: style ?? theme.textTheme.titleMedium,
    );
  }
}

class ConnexionButton extends StatelessWidget {
  const ConnexionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Connexion with Google'.hardcoded,
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(width: 8),
          Image(
            image: AssetImage('assets/icons/google_icon.png'.hardcoded),
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
