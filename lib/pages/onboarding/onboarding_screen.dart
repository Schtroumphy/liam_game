import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/pages/onboarding/widgets/bottom_buttons_navigation.dart';
import 'package:liam_game/pages/onboarding/widgets/onboarding_app_bar.dart';
import 'package:liam_game/pages/onboarding/model/onboarding_model.dart';
import 'package:liam_game/pages/onboarding/widgets/scrolling_chips.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  changePage(int current) {
    setState(() {
      _currentPage = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: models.length,
      onPageChanged: (index) => changePage(index),
      itemBuilder: (_, index) => OnBoardingContent(
        currentIndex: _currentPage,
        model: models[_currentPage],
        onNextCLick: () => _pageController.nextPage(
          duration: 600.milliseconds,
          curve: Curves.linearToEaseOut,
        ),
        onSkipClick: null,
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key, required this.currentIndex, required this.model, this.onNextCLick, this.onSkipClick});

  final int currentIndex;
  final OnBoardingDataModel model;
  final VoidCallback? onNextCLick;
  final VoidCallback? onSkipClick;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * 0.4),
        child: OnBoardingAppBar(
          currentIndex: currentIndex,
          imagePath: model.imagePath,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            SizedBox(
              width: size.width * 0.6,
              child: Text(
                model.title,
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 1),
            ScrollingChips(labels: model.labels, reversed: false),
            ScrollingChips(
              labels: model.labels,
              reversed: true,
            ),
            const Spacer(flex: 7),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonsNavigation(
        onNextClick: onNextCLick,
        onSkipClick: onSkipClick,
        canSkip: currentIndex != 0,
      ),
    );
  }
}
