import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:motel_app/core/models/Rating.dart';

import 'package:motel_app/core/services/Database.dart';

class RatingViewModel extends ChangeNotifier {
  final Database _db = Database('rating');

  List<Rating> ratings;

  Future<List<Rating>> fetchRatings() async {
    var result = await _db.getDataCollection();
    ratings = result.documents
      .map((document) => Rating.fromMap(document.data, document.documentID))
      .toList();
    return ratings;
  }

  Stream<QuerySnapshot> fetchRatingsAsStream() {
    return _db.streamDataCollection();
  }

  Future<Rating> getRatingById(String id) async {
    var document = await _db.getDocumentById(id);
    return Rating.fromMap(document.data, document.documentID);
  }

  Future<void> addRating(Rating data) async {
    await _db.addDocument(data.toJson());
  }

  Future<void> updateRating(Rating data, String id) async {
    await _db.updateDocument(data.toJson(), id);
  }

  Future<void> removeRating(String id) async {
    await _db.removeDocument(id);
  }
}