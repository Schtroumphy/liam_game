import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/pages/home/model/game.dart';

final games = [
  Game('Other game'.hardcoded, 'assets/images/pencil.png', false),
  Game(
    'Ink Detection'.hardcoded,
    'assets/images/pencil.png',
    true,
    description: 'Translate, write and check your anwers .Be aware about the time !',
  ),
  Game('Other Game'.hardcoded, 'assets/images/pencil.png', false),
];
