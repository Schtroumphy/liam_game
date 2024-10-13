import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/widgets/game_header.dart';
import 'package:liam_game/pages/game/widgets/ink_panel.dart';
import 'package:liam_game/pages/game/widgets/rounded_colored_text.dart';
import 'package:liam_game/pages/home/widgets/home_header.dart';
import 'package:liam_game/theme/colors.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: AppHeader(
            title: 'Ink detection'.hardcoded,
            icon: Icons.menu,
          ),
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
        child: const SafeArea(
          child: Column(
            children: [
              GameHeader(),
              RoundedColoredText(),
              Expanded(
                child: InkPanel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
