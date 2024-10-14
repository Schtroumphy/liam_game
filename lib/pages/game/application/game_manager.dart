import 'package:flutter/foundation.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/game/model/word.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_manager.g.dart';

@Riverpod(keepAlive: true)
class GameManagerNotifier extends _$GameManagerNotifier {
  @override
  GameManager build() {
    return GameManager(status: GameStatus.notStarted, currentGame: null);
  }

  start(Game game) {
    state = GameManager(status: GameStatus.started, currentGame: game);
  }

  end() {
    state = GameManager(status: GameStatus.finished, currentGame: null);
  }

  pause() {
    state = GameManager(status: GameStatus.paused, currentGame: state.currentGame);
  }

  init() {
    if(state.currentGame !=null) {
      state.currentGame!.init?.call();
    }
  }
}

final class GameManager {
  final GameStatus status;
  final Game? currentGame;

  GameManager({required this.status, this.currentGame});

  GameManager copyWith({
    GameStatus? status,
    Game? currentGame,
  }) {
    return GameManager(
      status: status ?? this.status,
      currentGame: this.currentGame ?? currentGame,
    );
  }
}

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
  final VoidCallback? init;
  final T? data;

  Game(
    this.name, this.data, {
    required this.duration,
    required this.type,
    this.init,
  });
}

final class InkDetectionGame implements Game<List<Word>> {
  @override
  String get name => 'Ink Detection'.hardcoded;

  @override
  Duration get duration => 2.minutes;

  @override
  GameType get type => GameType.aiBased;

  @override
  VoidCallback? get init => null;

  @override
  List<Word>? get data => null;

}
