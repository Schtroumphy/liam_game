import 'package:flutter/cupertino.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';

import 'app_text.dart';

class DialogText extends StatelessWidget {
  const DialogText(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppText(
      label: label,
      padding: const EdgeInsets.symmetric(horizontal: Insets.m),
      textColor: AppColor.orange,
      fontWeight: FontWeight.w700,
    );
  }
}