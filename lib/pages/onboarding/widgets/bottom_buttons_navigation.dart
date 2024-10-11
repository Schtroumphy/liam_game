import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/widgets/button_icon.dart';

class BottomButtonsNavigation extends StatelessWidget {
  const BottomButtonsNavigation({super.key, this.onSkipClick, this.onNextClick, this.canSkip = true });

  final bool canSkip;
  final VoidCallback? onSkipClick;
  final VoidCallback? onNextClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Offstage(
            offstage: !canSkip,
            child: TextButton(
              onPressed: onSkipClick,
              child: Text("Skip".hardcoded),
            ),
          ),
          ButtonIcon(
            onClick: onNextClick,
            label: "Next".hardcoded,
            child: const Icon(Icons.arrow_forward_ios, size: 16,),
          )
        ],
      ),
    );
  }
}
