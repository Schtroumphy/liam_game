import 'package:flutter/material.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';
import 'package:liam_game/widgets/Spaces.dart';
import 'package:liam_game/widgets/rounded_button.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
          const DialogBigText(Constants.finishedGame),
          Image.asset(Constants.smiley),
          const DialogBigText("+ 126 points"),
          const Space(size: Insets.m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.m),
            child: RoundedButton(
              onPressed: () {
                Navigator.of(context).pop(); // TODO Change to go back to home page
              },
              label: Constants.goBack,
              fullWidth: true,
              color: AppColor.green,
                textColor : AppColor.black.withOpacity(0.45)
            ),
          ),
          const Space(size: Insets.m),
        ],
      ),
    );
  }
}

class DialogBigText extends StatelessWidget {
  const DialogBigText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.m),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: Constants.zenMaruGothic,
            fontSize: TextSize.l,
            color: AppColor.orange,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
