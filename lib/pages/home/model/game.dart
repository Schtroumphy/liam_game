class Game {
  const Game(this.name, this.imagePath, this.isAvailable, {this.description});

  final String name;
  final String? description;
  final String? imagePath;
  final bool isAvailable;
}
