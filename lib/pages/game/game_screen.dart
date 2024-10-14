import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/application/game_manager.dart';
import 'package:liam_game/pages/game/end_game_screen.dart';
import 'package:liam_game/pages/game/widgets/game_header.dart';
import 'package:liam_game/pages/game/ink_detection_game/ink_panel.dart';
import 'package:liam_game/pages/home/widgets/home_header.dart';
import 'package:liam_game/theme/colors.dart';

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
          child: [GameStatus.started, GameStatus.paused].contains(gameManager.status)
              ? AppHeader(title: gameManager.currentGame?.name, icon: Icons.menu)
              : const SizedBox.shrink(),
        ),
      ),
      body: switch (gameManager.status) {
        GameStatus.notStarted => Center(
            child: Text('Game is not started yet'.hardcoded),
          ),
        GameStatus.loading => const CircularProgressIndicator(),
        GameStatus.started => const GameStartedScreen(),
        GameStatus.paused => Text('Game not started'.hardcoded),
        GameStatus.finished => const EndGameScreen(),
      },
    );
  }
}

class GameStartedScreen extends StatelessWidget {
  const GameStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Expanded(
              child: InkPanel(),
            ),
          ],
        ),
      ),
    );
  }
}
