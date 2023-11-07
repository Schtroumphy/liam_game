import 'package:flutter/material.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/style/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isEnabled = true,
    this.fullWidth = false,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool isEnabled;
  final bool fullWidth;
  final IconData? icon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: isEnabled ? onPressed : null,
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          Text(
            label,
            style: TextStyle(fontSize: TextSize.s, fontFamily: Constants.zenMaruGothic, color: textColor ?? AppColor.brown),
          ),
        ],
      ),
    );
  }
}
