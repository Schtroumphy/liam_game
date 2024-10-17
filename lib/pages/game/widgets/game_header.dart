import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liam_game/core/extensions/build_context_extension.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/application/game_manager.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/app_text.dart';

class GameHeader extends ConsumerWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameManager = ref.watch(gameManagerNotifierProvider);

    return AppPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: gameManager.score),
            duration: 400.milliseconds,
            builder: (context, value, child) {
              return AppText(
                '$value pts'.hardcoded,
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryBlack,
                ),
              );
            },
          ),
          TimeText(
            duration: gameManager.currentGame?.duration ?? 5.seconds,
            onFinished: () {
              ref.read(gameManagerNotifierProvider.notifier).end();
            },
          ),
        ],
      ),
    );
  }
}

class TimeText extends StatefulWidget {
  const TimeText({super.key, required this.duration, this.onFinished});

  final Duration duration;
  final VoidCallback? onFinished;

  @override
  State<TimeText> createState() => _TimeTextState();
}

class _TimeTextState extends State<TimeText> {
  late Duration _duration;
  late Timer _timer;

  void countDown(Timer timer) {
    setState(() {
      if (_duration.inSeconds > 0) {
        _duration = _duration - const Duration(seconds: 1);
      } else {
        _timer.cancel();
        widget.onFinished?.call();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _duration = widget.duration;
    _timer = Timer.periodic(1.seconds, countDown);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _printDuration(_duration),
      style: context.textTheme.labelLarge?.copyWith(
        color: _duration.inSeconds < 10 ? Colors.red : AppColors.primaryBlack,
      ),
    );
  }
}
