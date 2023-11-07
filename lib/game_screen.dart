import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Ink;
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/TextSize.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';
import 'package:liam_game/widgets/Spaces.dart';
import 'package:liam_game/widgets/countdown_timer.dart';
import 'package:liam_game/widgets/rounded_box.dart';
import 'package:liam_game/widgets/rounded_button.dart';

import 'features/digital_ink_recognition/digital_ink_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Ink _ink = Ink();
  List<StrokePoint> _points = [];

  final isValidated = false;
  final isError = false;

  @override
  Widget build(BuildContext context) {

    final double displayResult = _isValidated ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            Constants.gameName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CountdownTimer(
              duration: Constants.gameDuration,
              onFinished: () => _onTimerFinished(context),
            ),
            RoundedBox(
              "Clavier",
              color: AppColor.gray,
              textSize: TextSize.m,
            ),
            Flexible(
              child: GestureDetector(
                onPanStart: (DragStartDetails details) {
                  _ink.strokes.add(Stroke());
                },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    final RenderObject? object = context.findRenderObject();
                    final localPosition = (object as RenderBox?)
                        ?.globalToLocal(details.localPosition);
                    if (localPosition != null) {
                      _points = List.from(_points)
                        ..add(StrokePoint(
                          x: localPosition.dx,
                          y: localPosition.dy,
                          t: DateTime.now().millisecondsSinceEpoch,
                        ));
                    }
                    if (_ink.strokes.isNotEmpty) {
                      _ink.strokes.last.points = _points.toList();
                    }
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  _points.clear();
                  setState(() {});
                },
                  child: CustomPaint(
                    painter: Signature(ink: _ink),
                    //size: Size.infinite,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.yellow),
                            borderRadius: BorderRadius.circular(10)
                        ),
                    ),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: isValidated ? 1 : 0,
              child: RoundedBox(
                "😕 Keabord is not the good answer",
                color: isError ? AppColor.red : AppColor.gray,
              ),
            ),
            const Space(size: Insets.m),
            RoundedBox(
              "Check my response",
              color: ColorConstants.yellow,
            ),
            const Space(size: Insets.m),
            RoundedBox(
              "Score: -12",
              color: AppColor.blue,
            ),
            const Space(size: Insets.s),
          ],
        ),
      ),
    );
  }

  _onTimerFinished(BuildContext context) {
    if(kDebugMode) print("Timer finished");
  }
}
