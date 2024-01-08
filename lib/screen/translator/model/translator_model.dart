class TranslatorModel{
  String? status;
  DataModel? dataModel;

  TranslatorModel({this.status, this.dataModel});
  factory TranslatorModel.mapToModel(Map m1){
    return TranslatorModel(
      status: m1['status'],
      dataModel: DataModel.mapToModel(m1['data'])
    );
  }
}

class DataModel{
  String? translatedText;

  DataModel({this.translatedText});
  
  factory DataModel.mapToModel(Map m1){
    return DataModel(
      translatedText: m1['translatedText']
    );
  }
}