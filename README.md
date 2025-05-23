# Task Management Mobile App (Flutter Frontend)

## 📱 Description  
A **Flutter mobile application** frontend for managing daily tasks. Designed to work seamlessly with the ASP.NET Core backend API, providing a smooth and user-friendly interface.  

تطبيق موبايل مبني بـ Flutter لواجهة المستخدم لإدارة المهام اليومية، متصل بسلاسة مع الـ Backend المبني بـ ASP.NET Core، لتجربة مستخدم سهلة وسلسة.

---

## ✨ Features  
- User authentication (login/signup)  
- View, create, update, and delete tasks  
- Role-based UI adjustments (User/Admin)  
- Responsive and clean design  
- State management using Provider  
- API integration with the backend for data synchronization  

---

## 🛠 Technologies Used  
- **Flutter & Dart**  
- **Provider** (state management)  
- **HTTP** package (API calls)  
- **JSON serialization**  

---

## 📁 Project Structure (`lib/` folder)  

```
lib/
├── models/ # نماذج البيانات (مثل المهمة والمستخدم)
├── screens/ # شاشات التطبيق (تسجيل الدخول، قائمة المهام، إلخ)
├── services/ # خدمات الاتصال بالـ API والمنطق الأساسي
├── widgets/ # مكونات واجهة مستخدم قابلة لإعادة الاستخدام
└── main.dart # نقطة دخول التطبيق
```


---

## 🚀 Getting Started  

### 🔗 Backend API Integration  
This Flutter app connects to the backend API here:  
[🔗 Task Management Backend Repository](https://github.com/abdo7806/Task_management_project.git)

---

### ✅ Prerequisites  
- تثبيت [Flutter SDK](https://docs.flutter.dev/get-started/install)  
- وجود جهاز فعلي أو محاكي Emulator لتشغيل التطبيق  

---

### 📦 Installation  
```bash
git clone https://github.com/abdo7806/task_management_frontend.git
cd task_management_frontend
flutter pub get
flutter run
```
---
## ⚙️ Configuration | الإعدادات
Make sure the Backend API is running and accessible.
تأكد من تشغيل الـ Backend API وأنه متاح.

If needed, update the API URL in the file lib/services.
عدّل رابط الـ API في الملف lib/services إذا لزم الأمر.

---

## 📸 Screenshots | لقطات شاشة

### 🔐 Login & Register Screen  
![Login](https://github.com/abdo7806/task_management_frontend/blob/main/LoginScreen.png?raw=true)

### 👤 User Dashboard – Task Management  
![User Tasks](https://github.com/abdo7806/task_management_frontend/blob/main/UserTasks.png?raw=true)

### 🛠️ Admin Dashboard – User Management  
![Admin Panel](https://github.com/abdo7806/task_management_frontend/blob/main/AdminPanel.png?raw=true)

### 📂 Side Navigation Drawer  
![Sidebar](https://github.com/abdo7806/task_management_frontend/blob/main/Sidebar.png?raw=true)


## 👨‍💻 Developer | المطور

### 🙋‍♂️ About the Developer

I'm **Abdulsalam Dhahabi**, a passionate software developer with strong experience in desktop and web applications.

* C# WinForms & ASP.NET Core
* SQL Server & T-SQL
* Clean Architecture & Design Patterns
* Git & GitHub (2000+ problems solved)

🔗 GitHub: [github.com/abdo7806](https://github.com/abdo7806)
📧 Email: [balzhaby26@gmail.com](mailto:balzhaby26@gmail.com)
🌍 LinkedIn: [linkedin.com/in/abdulsalam-al-dhahabi-218887312](https://linkedin.com/in/abdulsalam-al-dhahabi-218887312)

---

## 🤝 Contributing | المساهمة

Contributions and feedback are welcome!
Feel free to open issues or submit pull requests.

---

## 📃 License | الترخيص

This project is open-source for learning and personal use only.  
هذا المشروع مفتوح المصدر لأغراض التعلم والاستخدام الشخصي فقط.
---
