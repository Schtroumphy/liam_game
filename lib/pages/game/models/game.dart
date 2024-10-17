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
  final String assetPath;
  final String shortDescription;
  final String description;
  final Duration duration;
  final GameType type;
  final Future<VoidCallback?> init;
  final T? data;

  Game(
    this.name, {
    this.data,
    required this.assetPath,
    required this.shortDescription,
    required this.description,
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
  Duration get duration => 1.minutes;

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
    final isDownloaded = await _modelManager.isModelDownloaded('en');

    if(!isDownloaded) {
      _modelManager.downloadModel('en').then((value) => print('Model downloaded ? ${value ? 'success' : 'failed'}'));
    }
  }

  @override
  String get description => '''
    In this game, you'll be given a French word, and your task is to translate it into English and write it on the board. Once you're done, check your answer. 
    If you're unsure of the translation, you can skip to the next word. Made a mistake? No worries—you can erase the board and try again.
  
    Good luck! You only have a limited time, so aim for the highest score you can before the clock runs out.
  '''
      .hardcoded;

  @override
  String get shortDescription => '''
    Can you translate as many French words as possible before time runs out? 
    Test your skills and aim for the highest score!
  ''';

  @override
  String get assetPath => 'assets/images/pencil.png';
}
