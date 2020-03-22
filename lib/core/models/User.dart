class User {
  String id;
  String fullName;
  String email;
  String password;
  DateTime createdAt;

  User ({this.id, this.fullName, this.email, this.password, this.createdAt});

  User.fromMap(Map data, String id):
    id = id ?? '',
    fullName = data ['fullname'] ?? '',
    email = data ['email'] ?? '',
    password = data ['password'] ?? '',
    createdAt = data ['createdAt'] ?? '';

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "createdAt": createdAt
    };
  }
}