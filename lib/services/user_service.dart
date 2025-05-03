import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/User_model.dart';

class UserService {
  final String apiUrl = 'https://localhost:7191/api/Users'; // استبدل بالـ API الخاص بك

  Future<List<User>> fetchUsers() async {
  
    final response = await http.get(Uri.parse('https://localhost:7191/api/Users/All'));
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
print('Response body: ${jsonList}');

      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('فشل في جلب البيانات');
    }
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('https://localhost:7191/api/Users/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('فشل في إضافة المستخدم');
    }
  }

  Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('فشل في تعديل المستخدم');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$userId'),
    );

    if (response.statusCode != 200) {
      throw Exception('فشل في حذف المستخدم');
    }
  }

  Future<User> getUserById(int userId) async {
    final response = await http.get(Uri.parse('$apiUrl/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('فشل في جلب المستخدم');
    }
  }
}