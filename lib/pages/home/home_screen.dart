import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/home/widgets/game_carousel.dart';
import 'package:liam_game/pages/home/widgets/home_header.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const SafeArea(
          child: HomeHeader(),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/line2.png'.hardcoded),
            fit: BoxFit.fitWidth,
            alignment: AlignmentDirectional.topStart,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: size.width * 0.7,
                child: AppText(
                  'Which game do you want to play today ?'.hardcoded,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ),
            const Spacer(flex: 1),
            GameCarousel(onGameSelected: (game) {
              setState(() {
                _isAvailable = game.isAvailable;
              });
            }),
            const Spacer(flex: 1),
            Align(
              alignment: Alignment.center,
              child: ButtonIcon(
                onClick: _isAvailable ? () {} : null,
                label: "Play".hardcoded,
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 16,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}