// lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String loginUrl = 'https://localhost:7191/api/Users/login'; // رابط تسجيل الدخول

 /* Future<String?> login(String username, String password) async {



    final response = await http.post(
      Uri.parse('$loginUrl'),
           headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'passwordHash': password,
      }),
    );

    if (response.statusCode == 200) {
      // استرجاع التوكن من الاستجابة
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['Token']; // إرجاع التوكن
    } else {
      // التعامل مع الأخطاء
      throw Exception('فشل تسجيل الدخول: ${response.reasonPhrase}');
    }
  }*/

   Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'passwordHash': password,
        'role' : "",
      }),
    );

    if (response.statusCode == 200) {
      // استرجاع البيانات من الاستجابة
      return jsonDecode(response.body); // إرجاع جميع البيانات
    } else {
      // التعامل مع الأخطاء
      throw Exception('فشل تسجيل الدخول: ${response.reasonPhrase}');
    }
  }
}