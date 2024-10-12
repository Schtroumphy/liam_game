import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/home/widgets/home_header.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';

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
        title: const SafeArea(
          child: AppHeader(
            title: 'Ink detection',
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
        child: SafeArea(
          child: Column(
            children: [
              const GameHeader(),
              const RoundedColoredText(),
              1.flex,
              const AppPadding(
                child: AspectRatio(
                  aspectRatio: 0.95,
                  child: InkPanel(),
                ),
              ),
              1.flex,
              ButtonIcon(
                label: 'Check'.hardcoded,
                onClick: () {},
                backgroundColor: AppColors.yellow,
                foregroundColor: AppColors.primaryBlack,
                child: const Icon(Icons.check),
              ),
              1.flex,
              MessageBox(
                'Good answer !'.hardcoded,
                displayed: false,
              ),
              1.flex
            ],
          ),
        ),
      ),
    );
  }
}

extension IntExtension on int {
  Widget get flex => AppFlex(this);
}

class AppFlex extends StatelessWidget {
  const AppFlex(this.flex, {super.key});

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Spacer(flex: flex);
  }
}

class GameHeader extends StatelessWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            '0 pts'.hardcoded,
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.primaryBlack,
            ),
          ),
          AppText(
            '01:24'.hardcoded,
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.primaryBlack,
            ),
          )
        ],
      ),
    );
  }
}

class RoundedColoredText extends StatelessWidget {
  const RoundedColoredText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlack,
        borderRadius: BorderRadius.circular(40),
        //shape: RoundedRectangleBorder
      ),
      child: Text(
        "Clavier".hardcoded,
        style: context.textTheme.labelMedium,
      ),
    );
  }
}

class InkPanel extends StatelessWidget {
  const InkPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.orange),
      ),
      child: Center(child: Text("Begin writing ...".hardcoded)),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox(this.message, {super.key, this.displayed});

  final String message;
  final bool? displayed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Opacity(
      opacity: displayed ?? false ? 1 : 0,
      child: AnimatedContainer(
        width: size.width * 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightOrange,
          borderRadius: BorderRadius.circular(30),
        ),
        duration: 2.seconds,
        child: Text(
          message,
          style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
