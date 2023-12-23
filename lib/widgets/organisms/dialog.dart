import 'package:flutter/material.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/home_screen.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';
import 'package:liam_game/widgets/atoms/dialog_text.dart';
import 'package:liam_game/widgets/atoms/spaces.dart';
import 'package:liam_game/widgets/molecules/rounded_button.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      backgroundColor: Colors.white,
      child: const ContentDialog(),
    );
  }
}

class ContentDialog extends StatelessWidget {
  const ContentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.m),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogText(Constants.finishedGame),
          Image.asset(Constants.smiley),
          const DialogText("+ 126 points"),
          const Space(Insets.m),
          RoundedButton(
            onPressed: () => _onPressed(context),
            label: Constants.goBack,
            fullWidth: true,
            color: AppColor.green,
            textColor: AppColor.black.withOpacity(0.45),
            padding: const EdgeInsets.symmetric(horizontal: Insets.m),
          ),
          const Space(Insets.m),
        ],
      ),
    );
  }

  // TODO Change to go back to home page
  _onPressed(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
}
