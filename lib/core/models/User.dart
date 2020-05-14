class UserData {
  String uid;
  String fullName;
  String email;

  UserData ({this.uid, this.fullName, this.email});

  UserData.fromMap(Map data, String uid):
    uid = uid ?? '',
    fullName = data ['fullName'] ?? '',
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