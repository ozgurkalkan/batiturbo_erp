import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String id;
  String name;
  String status;

  Customer({this.id, this.name, this.status});
  factory Customer.fromSnapshot(DocumentSnapshot snapshot){
    return Customer(
      id: snapshot.documentID, 
      name: snapshot.data['name'],
      status: snapshot.data['status']
      );
  }
}