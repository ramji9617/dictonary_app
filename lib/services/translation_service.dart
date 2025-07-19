import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  static Future<String> translateToHindi(String word) async {
    final url = Uri.parse(
      'https://api.mymemory.translated.net/get?q=${Uri.encodeComponent(word)}&langpair=en|hi',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['responseData']['translatedText'] ?? '';
      } else {
        print('Error ${response.statusCode}: ${response.body}');
        return '';
      }
    } catch (e) {
      print('Translation error: $e');
      return '';
    }
  }
}
