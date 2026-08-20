import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://10.0.2.2:3000/api';
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
}