import 'package:flutter/material.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../atoms/app_text.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key, required this.duration, this.onFinished})
      : super(key: key);

  final Duration duration;
  final Function? onFinished;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  final bool startTimer = false;

  double _currentWidth = 350;

  set currentWidth(double value) {
    setState(() {
      _currentWidth = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Insets.m),
      height: 20,
      width: 350,
      decoration: BoxDecoration(
        color: AppColor.red.withOpacity(0.5),
        border: Border.all(
          color: AppColor.red.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Stack(alignment: Alignment.centerLeft, children: [
        AnimatedContainer(
            padding: const EdgeInsets.all(Insets.m),
            width: _currentWidth,
            duration: Constants.gameDuration,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              color: AppColor.red,
            ),
            child: const SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(left: Insets.m),
          child: Countdown(
            seconds: widget.duration.inSeconds,
            interval: const Duration(milliseconds: 100),
            build: (BuildContext context, double time) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                currentWidth = time * 250 / widget.duration.inSeconds;
              });
              return AppText(
                label: "$time",
                textColor: time > 3 ? Colors.white : Colors.red,
                fontWeight: FontWeight.bold,
              );
            },
            onFinished: _onTimerFinished,
          ),
        ),
      ]),
    );
  }

  _onTimerFinished() => widget.onFinished?.call();
}
