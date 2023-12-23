import 'package:flutter/material.dart';
import 'package:liam_game/widgets/atoms/app_text.dart';

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
    this.padding,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool isEnabled;
  final bool fullWidth;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final mainSize = fullWidth ? MainAxisSize.max : MainAxisSize.min;

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: _onPressed,
        child: Row(
          mainAxisSize: mainSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white),
            AppText(
              label: label,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }

  _onPressed() => isEnabled ? onPressed() : null;
}
