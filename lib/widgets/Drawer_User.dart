import 'package:flutter/material.dart';
import 'package:task_management/screens/ProfileScreen.dart';
import 'package:task_management/screens/SettingsScreen.dart';
import 'package:task_management/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  final int userId;
  final String username;

  CustomDrawer({required this.userId, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إدارة الحساب',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  'User ID: $userId', // عرض ID المستخدم
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'Username: $username', // عرض اسم المستخدم
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
             leading: Icon(Icons.person),
            title: Text('الملف الشخصي'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(username: username, userId: userId),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('الإعدادات'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(), // فتح صفحة الإعدادات
                ),
               );
              // يمكنك إضافة منطق لفتح صفحة الإعدادات هنا

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('تسجيل الخروج'),
            onTap: () {
              // منطق تسجيل الخروج هنا
            //  Navigator.pop(context); // إغلاق القائمة الجانبية

              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (context)=>false);

            },
          ),
        ],
      ),
    );
  }
}