// lib/models/task_model.dart

class Task {
  int id;
  String name;
  String description;
  DateTime dueDate;
  bool completed;
  int userId;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.dueDate,
    required this.completed,
    required this.userId,
  });

  // تحويل البيانات من JSON إلى نموذج Task
  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  // تحويل نموذج Task إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'completed': completed,
      'userId': userId,
    };
  }
}