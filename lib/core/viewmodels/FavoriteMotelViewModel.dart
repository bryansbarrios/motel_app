import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:motel_app/core/models/FavoriteMotel.dart';

import 'package:motel_app/core/services/Database.dart';

class FavoriteViewModel extends ChangeNotifier {
  final Database _db = Database('favoriteMotels');

  List<FavoriteMotel> favoriteMotels;

  Future<List<FavoriteMotel>> fetchFavoriteMotels() async {
    var result = await _db.getDataCollection();
    favoriteMotels = result.documents
      .map((document) => FavoriteMotel.fromMap(document.data, document.documentID))
      .toList();
    return favoriteMotels;
  }

  Stream<QuerySnapshot> fetchFavoriteMotelsAsStream() {
    return _db.streamDataCollection();
  }

  Future<FavoriteMotel> getFavoriteMotelById(String id) async {
    var document = await _db.getDocumentById(id);
    return FavoriteMotel.fromMap(document.data, document.documentID);
  }

  Future<void> addFavoriteMotel(FavoriteMotel data) async {
    await _db.addDocument(data.toJson());
  }

  Future<void> removeFavoriteMotel(String id) async {
    await _db.removeDocument(id);
  }
}