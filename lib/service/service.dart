
import 'package:http/http.dart' as http;
class Service{
  static const baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse("$baseUrl$endPoint");

    try{
      response = await http.get(url);
    }on Exception {
      rethrow;
    }

    return response;

  }
}