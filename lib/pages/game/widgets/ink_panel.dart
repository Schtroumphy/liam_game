import 'package:flutter/material.dart' hide Ink;
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';
import 'package:liam_game/core/extensions/int_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/widgets/activity_indicator.dart';
import 'package:liam_game/pages/game/widgets/message_box.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_padding.dart';
import 'package:liam_game/widgets/button_icon.dart';

class InkPanel extends StatefulWidget {
  const InkPanel({super.key});

  @override
  State<InkPanel> createState() => _InkPanelState();
}

class _InkPanelState extends State<InkPanel> {
  final DigitalInkRecognizerModelManager _modelManager = DigitalInkRecognizerModelManager();
  var _language = 'en';
  final languages = ['en', 'fr'];

  var _digitalInkRecognizer = DigitalInkRecognizer(languageCode: 'en');
  final Ink _ink = Ink();
  List<StrokePoint> _points = [];
  String _recognizedText = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _downloadModel();
    });
  }

  @override
  void dispose() {
    _digitalInkRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPadding(
          child: AspectRatio(
            aspectRatio: .95,
            child: Container(
              clipBehavior: Clip.hardEdge, // To limit customPainter to container
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: AppColors.orange),
              ),
              child: Center(
                child: LayoutBuilder(builder: (context, constraints) {
                  return GestureDetector(
                    onPanStart: (DragStartDetails details) {
                      _ink.strokes.add(Stroke());
                    },
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        final RenderObject? object = context.findRenderObject();
                        final localPosition = (object as RenderBox?)?.globalToLocal(details.localPosition);
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
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _clearPad(),
              icon: const Icon(Icons.delete),
            ),
            ButtonIcon(
              label: 'Check'.hardcoded,
              onClick: () => _recogniseText(),
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.primaryBlack,
              child: const Icon(Icons.check),
            ),
          ],
        ),
        1.flex,
        Text('Recognized texts : $_recognizedText'),
        1.flex,
        MessageBox(
          'Good answer !'.hardcoded,
          displayed: false,
        ),
        1.flex
      ],
    );
  }

  Future<void> _downloadModel() async {
    Toast().show('Downloading model...', _modelManager.downloadModel(_language).then((value) => value ? 'success' : 'failed'), context, this);
  }

  _recogniseText() async {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Recognizing'),
            ),
        barrierDismissible: true);
    try {
      final candidates = await _digitalInkRecognizer.recognize(_ink);
      _recognizedText = '';
      for (final candidate in candidates) {
        _recognizedText += '${candidate.text} ,';
      }
      setState(() {});
    } catch (e) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
    if(context.mounted) Navigator.pop(context);
  }

  void _clearPad() {
    setState(() {
      _ink.strokes.clear();
      _points.clear();
      _recognizedText = '';
    });
  }
}

class Signature extends CustomPainter {
  Ink ink;

  Signature({required this.ink});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.orange
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (final stroke in ink.strokes) {
      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        canvas.drawLine(Offset(p1.x.toDouble(), p1.y.toDouble()), Offset(p2.x.toDouble(), p2.y.toDouble()), paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}
