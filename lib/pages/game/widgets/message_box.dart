import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/theme/colors.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(this.message, {super.key, this.displayed});

  final String message;
  final bool? displayed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Opacity(
      opacity: displayed ?? false ? 1 : 0,
      child: AnimatedContainer(
        width: size.width * 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightOrange,
          borderRadius: BorderRadius.circular(30),
        ),
        duration: 2.seconds,
        child: Text(
          message,
          style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
