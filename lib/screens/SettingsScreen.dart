import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // بطاقة تغيير كلمة المرور
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.lock, color: Colors.blue),
                title: Text('تغيير كلمة المرور'),
                onTap: () {
                  // منطق تغيير كلمة المرور هنا
                },
              ),
            ),
            SizedBox(height: 10),

            // بطاقة إعدادات الإشعارات
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.blue),
                title: Text('الإشعارات'),
                onTap: () {
                  // منطق إعدادات الإشعارات هنا
                },
              ),
            ),
            SizedBox(height: 10),

            // بطاقة اختيار اللغة
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.language, color: Colors.blue),
                title: Text('اللغة'),
                onTap: () {
                  // منطق اختيار اللغة هنا
                },
              ),
            ),
            SizedBox(height: 10),

            // بطاقة معلومات حول التطبيق
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text('حول التطبيق'),
                onTap: () {
                  // معلومات حول التطبيق هنا
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}