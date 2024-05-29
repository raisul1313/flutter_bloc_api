import 'package:http/http.dart' as http;

class HttpHelper {
  Future<http.Response> getRequest({required String endPoint}) async {
    try {
      final response = await http.get(Uri.parse(endPoint));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
