class UserData {
  String uid;
  String fullName;
  String email;
  String password;

  UserData ({this.uid, this.fullName, this.email, this.password});

  UserData.fromMap(Map data, String uid):
    uid = uid ?? '',
    fullName = data ['fullname'] ?? '',
    email = data ['email'] ?? '';

  toJson() {
    return {
      "uid" : uid,
      "fullName": fullName,
      "email": email
    };
  }
}

class User {

  final String uid;
  User({ this.uid });

}