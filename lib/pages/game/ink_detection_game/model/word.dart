import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Word {
  final String frWord;
  final String enWord;
  final String frDescription;
  final String enDescription;
  final int level;

  Word({required this.frWord, required this.enWord, required this.frDescription, required this.enDescription, required this.level});

  // Factory method to create a Word object from a JSON map
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
        frWord: json['fr_word'],
        enWord: json['en_word'],
        frDescription: json['fr_description'],
        enDescription: json['en_desc'],
        level: json['level']
    );
  }

  static Future<List<Word>> loadWords() async {
    // Charger le contenu du fichier JSON
    String jsonString = await rootBundle.loadString('assets/words/words.json');

    // Décoder la chaîne JSON en liste dynamique
    List<dynamic> jsonResponse = json.decode(jsonString);

    // Convertir chaque élément JSON en objet Word
    return jsonResponse.map((data) => Word.fromJson(data)).toList();
  }
}
