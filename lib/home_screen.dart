import 'package:flutter/material.dart';
import 'package:liam_game/widgets/atoms/app_title.dart';
import 'package:liam_game/widgets/molecules/play_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTitle(),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}
