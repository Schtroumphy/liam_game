import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Ink;
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:liam_game/common/constants.dart';
import 'package:liam_game/style/colors.dart';
import 'package:liam_game/style/insets.dart';
import 'package:liam_game/widgets/atoms/app_text.dart';
import 'package:liam_game/widgets/atoms/spaces.dart';
import 'package:liam_game/widgets/organisms/countdown_timer.dart';
import 'package:liam_game/widgets/organisms/dialog.dart';
import 'package:liam_game/widgets/molecules/rounded_box.dart';
import 'package:liam_game/widgets/molecules/rounded_button.dart';

import 'features/digital_ink_recognition/digital_ink_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  static const route = "/game_screen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Ink _ink = Ink();
  List<StrokePoint> _points = [];

  var _isValidated = false;
  final isError = false;

  set isValidated(bool validated) {
    setState(() {
      _isValidated = validated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double displayResult = _isValidated ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: AppText(label: Constants.gameName),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CountdownTimer(
              duration: Constants.gameDuration,
              onFinished: () => _onTimerFinished(context),
            ),
            RoundedBox("Clavier", backgroundColor: AppColor.gray),
            Flexible(
              child: GestureDetector(
                onPanStart: (DragStartDetails details) {
                  _ink.strokes.add(Stroke());
                },
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: CustomPaint(
                  painter: Signature(ink: _ink),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.yellow),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: displayResult,
              child: RoundedBox(
                "😕 Keabord is not the good answer",
                backgroundColor: isError ? AppColor.red : AppColor.gray,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  icon: Icons.format_clear_rounded,
                  label: "",
                  isEnabled: _ink.strokes.isNotEmpty,
                  color: AppColor.red,
                  onPressed: _onClearPadClicked,
                ),
                const Space(Insets.m, type: SpaceType.horizontal),
                RoundedButton(
                  label: "Check my response",
                  isEnabled: _ink.strokes.isNotEmpty,
                  onPressed: _onCheckAnswerClicked,
                ),
              ],
            ),
            const Space(Insets.m),
            RoundedBox(
              "Score: -12",
              backgroundColor: AppColor.blue,
              fullWidth: false,
            ),
            const Space(Insets.s),
          ],
        ),
      ),
    );
  }

  _onClearPadClicked() {
    setState(() {
      _ink.strokes.clear();
      _points.clear();
      isValidated = false;
    });
  }

  _onCheckAnswerClicked() {
    isValidated = true;
  }

  _onPanEnd(DragEndDetails details) {
    _points.clear();
    setState(() {});
  }

  _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      final RenderObject? object = context.findRenderObject();
      final localPosition =
          (object as RenderBox?)?.globalToLocal(details.localPosition);
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
  }

  _onTimerFinished(BuildContext context) {
    if (kDebugMode) print("Timer finished");
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const GameDialog();
        });
  }
}
