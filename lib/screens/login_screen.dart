// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:task_management/screens/SignUpPage.dart';
//import 'package:task_management/models/User_model.dart';
//import '../models/User_model.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'package:task_management/screens/UserManagementScreen.dart';
//import 'package:flutter/material.dart';
//import 'package:task_management/models/User_model.dart';
//import 'package:task_management/screens/UserManagementScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  final AuthService authService = AuthService();

  void login() async {
    try {

       var response = await authService.login(usernameController.text, passwordController.text);
           //  User user = User.fromJson(response);

        int userId = response['id']; // استخدم ID المستخدم الفعلي
       String username = response['role'];

     //   var role = response['role']; // الحصول على الدور من النتيجة

      if(response['role'] == "admin"){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserManagementScreen(userId: userId, username: username)));
      }

       
       else{
    // تخزين التوكن أو معلومات المستخدم إذا كنت بحاجة إلى ذلك

    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userId: userId, username: username)));

       }
     /* var response = await authService.login(usernameController.text, passwordController.text);
      // تخزين التوكن أو معلومات المستخدم إذا كنت بحاجة إلى ذلك
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userId: 1))); // استخدم ID المستخدم الفعلي
      */
    } catch (e) {
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userId: 1))); // استخدم ID المستخدم الفعلي

      // التعامل مع الأخطاء
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Login')),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
                  SizedBox(height: 20),

              ElevatedButton(
              onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}