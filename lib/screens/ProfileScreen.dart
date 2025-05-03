import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final int userId;

  ProfileScreen({required this.username, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة اسم المستخدم
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    SizedBox(width: 16),
                    Text(
                      'اسم المستخدم: $username',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // بطاقة رقم المستخدم
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.assignment, size: 40),
                    SizedBox(width: 16),
                    Text(
                      'رقم المستخدم: $userId',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}