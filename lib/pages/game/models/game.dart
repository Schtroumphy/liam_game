import 'package:flutter/foundation.dart';
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/ink_detection_game/model/word.dart';

enum GameStatus {
  notStarted,
  loading,
  started,
  paused,
  finished;
}

enum GameType {
  aiBased,
  fast,
}

sealed class Game<T> {
  final String name;
  final Duration duration;
  final GameType type;
  final Future<VoidCallback?> init;
  final T? data;

  Game(
    this.name,
    this.data, {
    required this.duration,
    required this.type,
    required this.init,
  });
}

final class InkDetectionGame implements Game<List<Word>> {
  final DigitalInkRecognizerModelManager _modelManager = DigitalInkRecognizerModelManager();

  @override
  String get name => 'Ink Detection'.hardcoded;

  @override
  Duration get duration => 10.seconds;

  @override
  GameType get type => GameType.aiBased;

  @override
  Future<VoidCallback?> get init async {
    await _downloadModel();

    await Future.delayed(4.seconds);
    return null;
  }

  @override
  List<Word>? get data => null;

  Future<void> _downloadModel() async {
    _modelManager.downloadModel('en').then((value) => print('Model downloaded ? ${value ? 'success' : 'failed'}'));
  }
}
