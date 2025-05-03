import 'package:flutter/material.dart';
import 'package:task_management/widgets/Drawer_User.dart';
import '../models/task_model.dart'; // تأكد من المسار الصحيح
import '../services/task_service.dart';

class HomeScreen extends StatefulWidget {
  final int userId;
  final String username;

  HomeScreen({required this.userId, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Task> tasks = [];

  final TaskService taskService = TaskService();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final taskList = await taskService.getTasks(widget.userId);
      setState(() {
        tasks = taskList; // تحديث قائمة المهام
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تحميل المهام: $e')),
      );
    }
  }

  void addTask(Task task) async {
    try {
      await taskService.addTask(task);
      loadTasks(); // تحديث القائمة بعد الإضافة
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في إضافة المهمة: $e')),
      );
    }
  }

  void deleteTask(int id) async {
    try {
      await taskService.deleteTask(id);
      loadTasks(); // تحديث القائمة بعد الحذف
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في حذف المهمة: $e')),
      );
    }
  }

void editTask(Task task) async {
  
  final nameController = TextEditingController(text: task.name);
  final descriptionController = TextEditingController(text: task.description);
  bool isCompleted = task.completed; // حالة المهمة

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('تعديل المهمة'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'اسم المهمة'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'الوصف'),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          isCompleted = value ?? false; // تحديث الحالة
                        });
                      },
                    ),
                    Text('هل المهمة مكتملة؟'),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              var updatedTask = Task(
                id: task.id,
                name: nameController.text,
                description: descriptionController.text,
                dueDate: task.dueDate,
                completed: isCompleted, // استخدام حالة المهمة
                userId: task.userId,
              );
              updateTask(updatedTask);
              Navigator.of(context).pop();
            },
            child: Text('تعديل'),
          ),
        ],
      );
    },
  );
}
  void updateTask(Task task) async {
    try {
      await taskService.updateTask(task);
      loadTasks(); // تحديث القائمة بعد التعديل
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تعديل المهمة: $e')),
      );
    }
  }

  void showAddTaskDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('إضافة مهمة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم المهمة'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'الوصف'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var newTask = Task(
                  id: 0, // سيتم تعيين هذا من الـ API بعد الإضافة
                  name: nameController.text,
                  description: descriptionController.text,
                  dueDate: DateTime.now().add(Duration(days: 7)), // مثال على تاريخ الاستحقاق
                  completed: false,
                  userId: widget.userId,
                );
                addTask(newTask);
                Navigator.of(context).pop();
              },
              child: Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('إدارة المهام (${tasks.length})${widget.userId}')),
    body: ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //elevation: 4,
          color: task.completed ? Colors.green[50] : Colors.red[50],
          child: ListTile(
            leading: Icon(
              task.completed ? Icons.check_circle : Icons.radio_button_unchecked,
              color: task.completed ? Colors.green : Colors.red,
            ),
            title: Text(
              task.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: task.completed ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              task.description,
              style: TextStyle(color: Colors.grey[700]),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => editTask(task),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteTask(task.id),
                ),
              ],
            ),
          ),
        );
      },
    ),


    drawer: CustomDrawer(userId: widget.userId, username: widget.username,) ,

    floatingActionButton: FloatingActionButton(
      onPressed: showAddTaskDialog,
      child: Icon(Icons.add),
    ),
  );
}
}