import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logic_translator/screen/translator/model/translator_model.dart';

class APIHelper {
  static APIHelper apiHelper = APIHelper._();

  APIHelper._();

  //translator API[post]
  Future<TranslatorModel?> translatorAPICall() async {
    String apiLink = "https://text-translator2.p.rapidapi.com/translate";
    var response = await http.post(Uri.parse(apiLink), headers: {
      "X-RapidAPI-Key": "588b0dcfc1msh755d7bf01729233p1b3108jsn09e365ae514d",
      "X-RapidAPI-Host": "text-translator2.p.rapidapi.com"
    }, body: {
      "source_language": "en",
      "target_language": "hi",
      "text": "keval"
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return TranslatorModel.mapToModel(json);
    }
    return null;
  }
}
