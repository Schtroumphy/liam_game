import 'package:liam_game/pages/game/models/game.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_manager.g.dart';

@Riverpod(keepAlive: true)
class GameManagerNotifier extends _$GameManagerNotifier {
  @override
  GameManager build() {
    return GameManager(status: GameStatus.notStarted, currentGame: null);
  }

  init(Game game) async {
    state = state.copyWith(status: GameStatus.loading, currentGame: game);
    print('State is now: ${state.status}');
    await state.currentGame?.init;

  }
  start() async {
    state = state.copyWith(status: GameStatus.started);
    print('State is now: ${state.status}');
  }

  end() {
    state = GameManager(status: GameStatus.finished, currentGame: null);
  }

  pause() {
    state = GameManager(status: GameStatus.paused);
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
