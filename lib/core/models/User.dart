class UserData {
  String uid;
  String fullName;
  String email;
  String password;
  DateTime createdAt;

  UserData ({this.uid, this.fullName, this.email, this.password, this.createdAt});

  UserData.fromMap(Map data, String uid):
    uid = uid ?? '',
    fullName = data ['fullname'] ?? '',
    email = data ['email'] ?? '',
    createdAt = data ['createdAt'] ?? '';

  toJson() {
    return {
      "uid" : uid,
      "fullName": fullName,
      "email": email,
      "createdAt": createdAt
    };
  }
}

class User {

  final String uid;
  User({ this.uid });

}