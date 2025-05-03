import 'package:flutter/material.dart';
import 'package:task_management/widgets/Drawer_User.dart';
import '../models/User_model.dart'; // تأكد من وجود نموذج المستخدم
import '../services/user_service.dart'; // تأكد من وجود خدمة المستخدم

class UserManagementScreen extends StatefulWidget {
    final int userId;
  final String username;

  UserManagementScreen({required this.userId, required this.username});

  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<User> users = [];
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      final userList = await userService.fetchUsers();
      setState(() {

        users = userList; // تحديث قائمة المستخدمين
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تحميل المستخدمين: $e ${users.length}')),
      );
    }
  }

  void addUser(User user) async {
    try {
      await userService.addUser(user);
      loadUsers(); // تحديث القائمة بعد الإضافة
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في إضافة المستخدم: $e')),
      );
    }
  }

  void deleteUser(int id) async {
    try {
      await userService.deleteUser(id);
      loadUsers(); // تحديث القائمة بعد الحذف
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في حذف المستخدم: $e')),
      );
    }
  }

  void editUser(User user) async {
    final nameController = TextEditingController(text: user.username);
    final roleController = TextEditingController(text: user.role);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تعديل المستخدم'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم المستخدم'),
              ),
              TextField(
                controller: roleController,
                decoration: InputDecoration(labelText: 'الدور'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var updatedUser = User(
                  id: user.id,
                  username: nameController.text,
                  passwordHash: user.passwordHash, // لا نحتاج لتغيير كلمة السر
                  role: roleController.text,
                );
                updateUser(updatedUser);
                Navigator.of(context).pop();
              },
              child: Text('تعديل'),
            ),
          ],
        );
      },
    );
  }

  void updateUser(User user) async {
    try {
      await userService.updateUser(user);
      loadUsers(); // تحديث القائمة بعد التعديل
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تعديل المستخدم: $e')),
      );
    }
  }

  void showAddUserDialog() {
    final nameController = TextEditingController();
    final passwordHashController = TextEditingController();
    final roleController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('إضافة مستخدم'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم المستخدم'),
              ),
              TextField(
                controller: passwordHashController,
                decoration: InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true, // إخفاء كلمة المرور
              ),
              TextField(
                controller: roleController,
                decoration: InputDecoration(labelText: 'الدور'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var newUser = User(
                  id: 0, // سيتم تعيين هذا من الـ API بعد الإضافة
                  username: nameController.text,
                  passwordHash: passwordHashController.text, // إضافة كلمة السر
                  role: roleController.text,
                );
                addUser(newUser);
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
      appBar: AppBar(title: Text('إدارة المستخدمين (${users.length})${widget.userId}')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(user.username),
              subtitle: Text('الدور: ${user.role}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => editUser(user),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteUser(user.id),
                  ),
                ],
              ),
            ),
          );
        },
      ),


      drawer: CustomDrawer(userId: widget.userId, username: widget.username,) ,

      
      floatingActionButton: FloatingActionButton(
        onPressed: showAddUserDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}