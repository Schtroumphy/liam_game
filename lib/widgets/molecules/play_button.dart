import 'package:flutter/material.dart';
import 'package:liam_game/game_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onPressed(context),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.red,
        padding: const EdgeInsets.all(16)
      ),
      child: const Icon(
        Icons.play_arrow_rounded,
        color: Colors.white,
      ),
    );
  }

  _onPressed(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const GameScreen()),
  );
}
