import 'package:flutter/material.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/style/colors.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox(
    this.text, {
    Key? key,
    this.color,
    this.textSize = TextSize.s,
  }) : super(key: key);

  final Color? color;
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: color ?? AppColor.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.black,
          fontSize: textSize,
        ),
      ),
    );
  }
}
