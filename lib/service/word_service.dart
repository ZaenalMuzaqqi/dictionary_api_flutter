import 'dart:io';
import 'service.dart';
import '../model/model.dart';

class WordService{
  static Future<List<DictionaryModel>?> getWordFromDictionary(String query) async{
    try{
      final response = await Service.getRequest(query);
      if(response.statusCode == 200){
        final result = dictionaryModelFromJson(response.body);
        return result;
      }else{
        return null;
      }
    }on SocketException {
      rethrow;
    }on HttpException {
      rethrow;
    }on FormatException {
      rethrow;
    }

  }
}