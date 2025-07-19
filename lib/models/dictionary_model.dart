class DictionaryModel {
  final String word;
  final String phonetic;
  final List<String> definitions;
  final List<String> examples;
  final List<String> synonyms;
  final String wordClass;

  DictionaryModel({
    required this.word,
    required this.phonetic,
    required this.definitions,
    required this.examples,
    required this.synonyms,
    required this.wordClass,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    final meaning = json['meanings'][0];
    final definitions = meaning['definitions'] as List;

    return DictionaryModel(
      word: json['word'],
      phonetic: json['phonetic'] ?? '',
      wordClass: meaning['partOfSpeech'] ?? '',
      definitions: definitions
          .take(3)
          .map((d) => d['definition'] ?? '')
          .cast<String>()
          .toList(),
      examples: definitions
          .where((d) => d['example'] != null)
          .take(3)
          .map((d) => d['example'].toString())
          .toList(),
      synonyms: (meaning['synonyms'] as List).take(10).map((s) => s.toString()).toList(),
    );
  }
}
