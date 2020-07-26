import 'package:bati_turbo_erp/models/conversation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  final Firestore _firestore = Firestore.instance;
  Stream<List<Conversation>> getConversations(String userId) {

    var ref = _firestore
    .collection('customers')
    .where('members', arrayContains: userId);

    return ref.snapshots().map((list) =>
        list.documents.map((snapshot) => Conversation.fromSnapshot(snapshot))
        .toList());
  }
}