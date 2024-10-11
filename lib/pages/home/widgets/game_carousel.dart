import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/mock/games_mock.dart';
import 'package:liam_game/pages/home/model/game.dart';
import 'package:liam_game/pages/home/widgets/game_carousel_card.dart';
import 'package:liam_game/widgets/app_padding.dart';

class GameCarousel extends StatefulWidget {
  const GameCarousel({super.key, required this.onGameSelected});

  final Function(Game) onGameSelected;

  @override
  State<GameCarousel> createState() => _GameCarouselState();
}

class _GameCarouselState extends State<GameCarousel> {
  late PageController _pageController;
  final int _currentPage = (games.length / 2).floor();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: PageView.builder(
        itemCount: games.length,
        controller: _pageController,
        onPageChanged: (index) {
          widget.onGameSelected(games[index]);
        },
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) => AppPadding(
          child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = 0.0;
                if (_pageController.position.haveDimensions) {
                  value = index.toDouble() - (_pageController.page ?? 0);
                  value = (value * 0.038).clamp(-1, 1);
                }
                return Transform.rotate(
                  angle: pi * value,
                  child: GameCarouselCard(
                    game: games[index],
                    isFirst: index == 0,
                    isLast: index == games.length - 1,
                    onNextClick: _onNextClick,
                    onPreviousClick: _onPreviousClick,
                  ),
                );
              }),
        ),
      ),
    );
  }

  _onNextClick() {
    _pageController.nextPage(duration: 1.seconds, curve: Curves.ease);
  }

  _onPreviousClick() {
    _pageController.previousPage(duration: 1.seconds, curve: Curves.ease);
  }
}
