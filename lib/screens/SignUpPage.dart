import 'package:flutter/material.dart';
import 'package:task_management/models/User_model.dart';
import 'package:task_management/services/user_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String confirmPassword = ''; // حقل تأكيد كلمة المرور
  final UserService userService = UserService();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('كلمة المرور وتأكيد كلمة المرور لا تتطابق')),
        );
        return;
      }

      User user = User(
        id: 0, 
        username: username, 
        passwordHash: password, 
        role: 'user'); 
      try {
        await userService.addUser(user);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إنشاء الحساب بنجاح!')),
        );
      } catch (e) {
        // إذا حدث خطأ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل في إنشاء الحساب: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إنشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'اسم المستخدم'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال اسم المستخدم';
                  }
                  return null;
                },
                onChanged: (value) {
                  username = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال كلمة المرور';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'تأكيد كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى تأكيد كلمة المرور';
                  }
                  return null;
                },
                onChanged: (value) {
                  confirmPassword = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('إنشاء حساب'),
              ),

                  SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                   Navigator.of(context).pop();
                },
                child: Text('خروج', style: TextStyle(color: Colors.red),),
                style: ElevatedButton.styleFrom(iconColor: Colors.red), // لون مختلف للزر
              ),
            ],
          ),
        ),
      ),
    );
  }
}