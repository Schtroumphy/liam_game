import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/theme/colors.dart';

class RoundedColoredText extends StatelessWidget {
  const RoundedColoredText(this.text, {super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlack,
        borderRadius: BorderRadius.circular(40),
        //shape: RoundedRectangleBorder
      ),
      child: text != null
          ? Text(
              text ?? "Clavier".hardcoded,
              style: context.textTheme.labelMedium,
            )
          : const SizedBox.shrink(),
    );
  }
}
