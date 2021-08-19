import 'package:http/http.dart' as http;

class ApiService {
  ///This should be a singleton or provider to prevent multiple instances
  final client = http.Client();
  String _baseUrl = 'http://partnerapi.funda.nl/feeds/Aanbod.svc/json/';

  Future<String> getApiData(String url) async {
    try {
      var uriResponse = await client.get(Uri.parse(_baseUrl + url));
      return uriResponse.body;
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return '';
    } finally {
      client.close();
    }
  }
}
