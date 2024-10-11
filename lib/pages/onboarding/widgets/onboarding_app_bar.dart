import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({super.key, required this.currentIndex, required this.imagePath});

  final int currentIndex;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.4 * 0.8;
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ObBoardingProgressBars(
            currentIndex: currentIndex,
          ),
          Flexible(
              child: Image.asset(
            imagePath,
            height: height,
          )),
        ],
      ),
    );
  }
}

class ObBoardingProgressBars extends StatelessWidget {
  const ObBoardingProgressBars({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (index) => Bar(isSelected: index == currentIndex),
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 2,
        width: 100,
        color: isSelected ? AppColors.primaryBlack : Colors.grey,
      ),
    );
  }
}
