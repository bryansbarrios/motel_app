import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:motel_app/core/models/MotelType.dart';
import 'package:motel_app/core/services/Database.dart';

class MotelTypeViewModel extends ChangeNotifier {
  final Database _db = Database('motelType');

  List<MotelType> types;

  Future<List<MotelType>> fetchTypes() async {
    var result = await _db.getDataCollection();
    types = result.documents
      .map((document) => MotelType.fromMap(document.data, document.documentID))
      .toList();
    return types;
  }

  Stream<QuerySnapshot> fetchTypesAsStream() {
    return _db.streamDataCollection();
  }

  Future<MotelType> getTypeById(String id) async {
    var document = await _db.getDocumentById(id);
    return MotelType.fromMap(document.data, document.documentID);
  }
}