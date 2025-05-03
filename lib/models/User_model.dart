class User {
  final int id;
  final String username;
  final String passwordHash; // حقل كلمة المرور
  final String role;

  User({required this.id, required this.username, required this.passwordHash, required this.role});

  // تحويل البيانات من JSON إلى نموذج User
  static User fromJson(Map<String, dynamic> json) {
    
    return User(
      id: json['id'],
      username: json['username'],
      passwordHash: json['passwordHash'].toString(), // جلب كلمة المرور
      role: json['role'],
    );
  }

  // تحويل نموذج User إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'passwordHash': passwordHash, // تضمين كلمة المرور
      'role': role,
    };
  }
}