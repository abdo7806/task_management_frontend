// lib/services/task_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TaskService {
  final String baseUrl = 'https://localhost:7191/api/Tasks'; // استبدل بـ URL الخاص بك


  Future<List<Task>> getTasks(int userId) async {
    final response = await http.get(Uri.parse('https://localhost:7191/api/Tasks/All'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((task) => Task.fromJson(task)).where((task) => task.userId == userId).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }



  Future<void> addTask(Task task) async {
    await http.post(
      Uri.parse('$baseUrl/AddTask'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );
  }

  Future<void> updateTask(Task task) async {
    await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );
  }

  Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}