import 'package:flutter/material.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/widgets/atoms/app_text.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox(
    this.text, {
    Key? key,
    this.backgroundColor,
    this.fullWidth = true,
    this.icon,
  }) : super(key: key);

  final Color? backgroundColor;
  final String text;
  final IconData? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final width = fullWidth ? double.infinity : null;
    const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

    return Container(
      width: width,
      margin: padding,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          AppText(
            label: text,
            textColor: AppColor.black,
          ),
        ],
      ),
    );
  }
}
