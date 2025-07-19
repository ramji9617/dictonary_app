import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dictionary_model.dart';

class DictionaryService {
  static Future<DictionaryModel?> fetchWordData(String word) async {
    final url = Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body);
      return DictionaryModel.fromJson(jsonList[0]);
    } else {
      return null;
    }
  }
}
