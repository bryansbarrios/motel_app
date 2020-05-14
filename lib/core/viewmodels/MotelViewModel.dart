import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:motel_app/core/models/Motel.dart';
import 'package:motel_app/core/services/Database.dart';

class MotelViewModel extends ChangeNotifier {
  final Database _db = Database('motel');

  List<Motel> motels;

  Future<List<Motel>> fetchMotels() async {
    var result = await _db.getDataCollection();
    motels = result.documents
      .map((document) => Motel.fromMap(document.data, document.documentID))
      .toList();
    return motels;
  }

  Future<List<Motel>> searchMotels( String query) async {
    var result = await _db.getDataCollection();
    
    motels = result.documents
      .map((document) => Motel.fromMap(document.data, document.documentID))
      .toList();
      
    return motels;
  }

  Stream<QuerySnapshot> fetchMotelsAsStream() {
    return _db.streamDataCollection();
  }

  Future<Motel> getMotelById(String id) async {
    var document = await _db.getDocumentById(id);
    return Motel.fromMap(document.data, document.documentID);
  }
}