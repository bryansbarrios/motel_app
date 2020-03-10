import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference reference;

  Database(this.path) { 
    reference = _db.collection(path);
  }

  Future <QuerySnapshot> getDataCollection() {
    return reference.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return reference.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return reference.document(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return reference.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return reference.document(id).updateData(data);
  }
  
  Future<void> removeDocument(String id) {
    return reference.document(id).delete();
  }

}