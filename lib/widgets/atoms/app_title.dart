import 'package:flutter/cupertino.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/widgets/atoms/app_text.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        label: Constants.gameTitle,
        fontWeight: FontWeight.w800,
        textSize: TextSize.xxl,
      ),
    );
  }
}
