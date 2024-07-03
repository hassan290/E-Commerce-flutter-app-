import 'package:http/http.dart' as http;
import 'dart:convert';

class THttpHelper {
  static const String _baseUrl = "https://your-api-base-url.com";

  //Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    //Todo: Add headers if needed
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //Helper method to make a POST request
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    //Todo: Add headers if needed
    final response = await http.post(
        Uri.parse('$_baseUrl/$endpoint'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'}
    );
    return _handleResponse(response);
  }

  //Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    //Todo: Add headers if needed
    final response = await http.put(
        Uri.parse('$_baseUrl/$endpoint'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'}
    );
    return _handleResponse(response);
  }

  //Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    //Todo: Add headers if needed
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }



  //Helper method to handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
