import 'package:liam_game/core/extensions/string_extensions.dart';

class OnBoardingDataModel {
  const OnBoardingDataModel({required this.title, required this.imagePath, required this.labels});

  final String title;
  final String imagePath;
  final List<String> labels;
}

final models = [
  OnBoardingDataModel(
    title: "What do you want to learn ? 📚",
    imagePath: "assets/images/books.png".hardcoded,
    labels: ["English", "Dart", "Kotlin", "Everything", "I do not know", "Programmation"],
  ),
  OnBoardingDataModel(
    title: "L.I.A.M en quelques mots ✅",
    imagePath: "assets/images/calpin.png".hardcoded,
    labels: ["Game app", "AI models", "Traductions", "Just for fun", "Fast learning"],
  ),
  OnBoardingDataModel(
    title: "What do you like ? 👍",
    imagePath: "assets/images/opened_book.png".hardcoded,
    labels: ["Game", "Just enjoy", "Netflix & Chill", "Drink with friends"],
  ),
];
