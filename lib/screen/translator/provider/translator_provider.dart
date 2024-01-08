import 'package:flutter/material.dart';
import 'package:logic_translator/screen/translator/model/translator_model.dart';
import 'package:logic_translator/util/api_helper.dart';

class TranslatorProvider with ChangeNotifier{
  TranslatorModel? translatorModel;
  Future<void> getTranslatorData() async {
    TranslatorModel? model = await APIHelper.apiHelper.translatorAPICall();
    translatorModel = model;
    notifyListeners();
  }
}