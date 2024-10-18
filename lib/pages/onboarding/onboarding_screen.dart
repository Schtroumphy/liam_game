import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/pages/home/home_screen.dart';
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
    final pagesCount = models.length + 1; // Add avatar page

    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pagesCount,
      onPageChanged: (index) => changePage(index),
      itemBuilder: (_, index) => OnBoardingPage(
        currentIndex: _currentPage,
        model: models[_currentPage],
        onNextCLick: () => _nextPage(_pageController, _currentPage, pagesCount, context),
        onSkipClick: _goToHomePage,
      ),
    );
  }

  _goToHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  _nextPage(PageController controller, int currentPage, int maxPage, BuildContext context) {
    if (currentPage == maxPage - 1) {
      _goToHomePage();
      // TODO : To be changed by auto redirection if connected && onboarded
      return;
    }
    _pageController.nextPage(
      duration: 600.milliseconds,
      curve: Curves.linearToEaseOut,
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.currentIndex, required this.model, this.onNextCLick, this.onSkipClick});

  final int currentIndex;
  final OnBoardingDataModel model;
  final VoidCallback? onNextCLick;
  final VoidCallback? onSkipClick;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * 0.4),
        child: OnBoardingAppBar(
          currentIndex: currentIndex,
          imagePath: model.imagePath,
        ),
      ),
      body: Center(
          child: currentIndex == 0
              ? const OBSetPlayerContent()
              : OBChipsContent(
                  model: model,
                )),
      bottomNavigationBar: BottomButtonsNavigation(
        onNextClick: onNextCLick,
        onSkipClick: onSkipClick,
        canSkip: currentIndex != 0,
      ),
    );
  }
}

class OBChipsContent extends StatelessWidget {
  const OBChipsContent({super.key, required this.model});

  final OnBoardingDataModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
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
    );
  }
}

class OBSetPlayerContent extends StatelessWidget {
  const OBSetPlayerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        SizedBox(
          width: size.width * 0.6,
          child: Text(
            'Choose your avatar 🤟 !',
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 1),
        const AvatarCarousel(),
        const Spacer(flex: 7),
      ],
    );
  }
}

const images = [
  'avatar_1.png',
  'avatar_2.png',
  'avatar_3.png',
  'avatar_4.png',
];

class AvatarCarousel extends StatelessWidget {
  const AvatarCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        itemExtent: 330,
        shrinkExtent: 200,
        padding: const EdgeInsets.all(10.0),
        children: List.generate(
          images.length,
          (index) => Image.asset(
            "images/${images[index]}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
