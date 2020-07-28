import 'package:bati_turbo_erp/models/customers.dart';
import 'package:bati_turbo_erp/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  final Firestore _firestore = Firestore.instance;
  Stream<List<Customer>> getCustomer(String userId) {

    var ref = _firestore
    .collection('customer')
    .where('members', arrayContains: userId);

    return ref.snapshots().map((list) =>
        list.documents.map((snapshot) => Customer.fromSnapshot(snapshot))
        .toList());
  }

  Future<List<Profile>> getContacs() async {
    var ref = _firestore.collection("profile");

    var documents = await ref.getDocuments();

    print(documents.documents
    .map((snapshot) => Profile.fromSnapshot(snapshot)).toList());
    return documents.documents
    .map((snapshot) => Profile.fromSnapshot(snapshot)).toList();
  }
}