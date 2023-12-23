import 'package:flutter/cupertino.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.label,
    this.textColor,
    this.textSize,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  final String label;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(Insets.s),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: textSize ?? TextSize.s,
            fontFamily: Constants.zenMaruGothic,
            color: textColor ?? AppColor.brown,
            fontWeight: fontWeight ?? FontWeight.normal),
      ),
    );
  }
}
