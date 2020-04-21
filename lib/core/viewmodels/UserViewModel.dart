import 'package:flutter/foundation.dart';
import 'package:motel_app/core/models/User.dart';
import 'package:motel_app/core/services/Database.dart';

class UserViewModel extends ChangeNotifier {
  final Database _db = Database('user');

  Future<void> addUser(UserData data) async {
    await _db.addDocument(data.toJson());
  }

  Future<UserData> getUserById(String id) async {
    var document = await _db.getDocumentById(id);
    return UserData.fromMap(document.data, document.documentID);
  }
}