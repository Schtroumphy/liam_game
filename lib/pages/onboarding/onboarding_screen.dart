import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:liam_game/core/extensions/int_extension.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/core/shared_pref_service.dart';
import 'package:liam_game/pages/home/home_screen.dart';
import 'package:liam_game/pages/onboarding/widgets/avatar_carousel.dart';
import 'package:liam_game/pages/onboarding/widgets/bottom_buttons_navigation.dart';
import 'package:liam_game/pages/onboarding/widgets/onboarding_app_bar.dart';
import 'package:liam_game/pages/onboarding/model/onboarding_model.dart';
import 'package:liam_game/pages/onboarding/widgets/scrolling_chips.dart';
import 'package:liam_game/theme/colors.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
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
    final pagesCount = models.length;

    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pagesCount,
      onPageChanged: (index) => changePage(index),
      itemBuilder: (_, index) => OnBoardingPage(
        currentIndex: _currentPage,
        model: models[_currentPage],
        onNextCLick: () =>
            _nextPage(_pageController, _currentPage, pagesCount, context),
        onSkipClick: _goToHomePage,
      ),
    );
  }

  _goToHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  _nextPage(PageController controller, int currentPage, int maxPage,
      BuildContext context) {
    if (currentPage == maxPage - 1) {
      _goToHomePage();
      // TODO : To be changed by auto redirection if connected && onboarded
      return;
    }
    if (currentPage == 0) {
      _formKey.currentState?.saveAndValidate();
      final playerName = _formKey.currentState?.value['player_name'];
      ref.read(sharedPrefServiceProvider).savePref('player_name', playerName);
    }
    _pageController.nextPage(
      duration: 600.milliseconds,
      curve: Curves.linearToEaseOut,
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.currentIndex,
      required this.model,
      this.onNextCLick,
      this.onSkipClick});

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
        child: model.child ?? OBChipsContent(model: model),
      ),
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
            'Choose your avatar and your player name 🤟 !'.hardcoded,
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        1.flex,
        const OBPlayerSetting(),
        7.flex,
      ],
    );
  }
}

final _formKey =
    GlobalKey<FormBuilderState>(debugLabel: 'onboarding_player_settings');

class OBPlayerSetting extends StatelessWidget {
  const OBPlayerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AvatarCarousel(),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 250),
          child: FormBuilder(
            key: _formKey,
            child: FormBuilderTextField(
              name: 'player_name',
              validator: FormBuilderValidators.required(),
              cursorColor: AppColors.white,
              style: const TextStyle(
                color: AppColors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Player name...',
              ),
            ),
          ),
        )
      ],
    );
  }
}
