import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/int_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/application/game_manager.dart';
import 'package:liam_game/pages/game/end_game_screen.dart';
import 'package:liam_game/pages/game/models/game.dart';
import 'package:liam_game/pages/game/widgets/game_header.dart';
import 'package:liam_game/pages/game/ink_detection_game/ink_panel.dart';
import 'package:liam_game/pages/home/widgets/home_header.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_image.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';
import 'package:liam_game/widgets/button_icon.dart';
import 'package:liam_game/widgets/rounded_asset.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameManager = ref.watch(gameManagerNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: [GameStatus.loading, GameStatus.started, GameStatus.paused].contains(gameManager.status)
              ? AppHeader(title: gameManager.currentGame?.name, icon: Icons.menu)
              : const SizedBox.shrink(),
        ),
      ),
      body: switch (gameManager.status) {
        GameStatus.notStarted => Center(
            child: Text('Game is not started yet'.hardcoded),
          ),
        GameStatus.loading => GameInitScreen(manager: gameManager),
        GameStatus.started => const GameStartedScreen(),
        GameStatus.paused => Text('Game not started'.hardcoded),
        GameStatus.finished => const EndGameScreen(),
      },
    );
  }
}

class GameInitScreen extends ConsumerWidget {
  const GameInitScreen({super.key, required this.manager});

  final GameManager manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = manager.currentGame;

    if (manager.currentGame == null) {
      return const Center(
        child: Text("No game initialized in manager"),
      );
    } else {
      return Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: AppImage('assets/images/home_line.png'.hardcoded,),
          ),
          SafeArea(
            child: Column(
              children: [
                1.flex,
                RoundedAsset(assetPath: game!.assetPath),
                1.flex,
                AppPadding(
                  child: AppText(game.description, style: context.textTheme.labelMedium?.copyWith(color: AppColors.primaryBlack)),
                ),
                2.flex,
                Align(
                  alignment: Alignment.center,
                  child: ButtonIcon(
                    onClick: () {
                      ref.read(gameManagerNotifierProvider.notifier).start();
                    },
                    label: "Play".hardcoded,
                    child: manager.status == GameStatus.loading
                        ? const Icon(
                            Icons.play_arrow_outlined,
                            size: 16,
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
                2.flex,
              ],
            ),
          ),
        ],
      );
    }
  }
}

class GameStartedScreen extends ConsumerWidget {
  const GameStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
            Expanded(
              child: InkPanel(addScore: (score) {
                ref.read(gameManagerNotifierProvider.notifier).addScore(score);
              },),
            ),
          ],
        ),
      ),
    );
  }
}
