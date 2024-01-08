import 'package:flutter/material.dart';
import 'package:logic_translator/screen/translator/model/translator_model.dart';
import 'package:logic_translator/util/api_helper.dart';

class TranslatorProvider with ChangeNotifier{
  TranslatorModel? translatorModel;

  List<String> lang=['hi','gu','de','af','am','ar','cs'];

  String tran = 'hi';

  void languageTran(String l1){
    tran = l1;
    notifyListeners();
  }

  Future<void> getTranslatorData(String edit) async {
    TranslatorModel? model = await APIHelper.apiHelper.translatorAPICall(edit,tran);
    translatorModel = model;
    notifyListeners();
  }
}