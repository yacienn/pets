import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://localhost:3000/home';
  Future<Map<String,dynamic>> post(
    String endpoint , Map<String,dynamic> body,
  )async{
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
     if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception(
      'Request failed: ${response.statusCode}',
    );
  }

  
  Future<Map<String, dynamic>> get(String endpoint) async {
  final response = await http.get(
    Uri.parse('$baseUrl$endpoint'),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode >= 200 &&
      response.statusCode < 300) {
    return jsonDecode(response.body);
  }

  throw Exception(
    'Request failed: ${response.statusCode} ${response.body}',
  );
}
}