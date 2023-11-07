import 'package:flutter/material.dart';
import 'package:liam_game/style/TextSize.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isEnabled = false,
    this.icon,
    this.color,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool isEnabled;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: isEnabled ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          Text(
            label,
            style: const TextStyle(fontSize: TextSize.s),
          ),
        ],
      ),
    );
  }
}
