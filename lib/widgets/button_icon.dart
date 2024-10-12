import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/theme/colors.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({super.key, required this.label, this.imagePath, this.child, this.onClick, this.backgroundColor, this.foregroundColor});

  final String label;
  final String? imagePath;
  final Widget? child;
  final VoidCallback? onClick;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final content = imagePath != null
        ? Image(image: AssetImage(imagePath!), width: 24, height: 24)
        : child != null
            ? child!
            : const Text("Unknown");

    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryBlack,
        foregroundColor: foregroundColor ?? AppColors.white,
          textStyle: context.textTheme.labelMedium?.copyWith(
            color: foregroundColor ?? AppColors.white
          )
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label),
        const SizedBox(width: 12),
        SizedBox(
          width: 24,
          height: 24,
          child: content,
        ),
      ]),
    );
  }
}
