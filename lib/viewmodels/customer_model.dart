import 'package:bati_turbo_erp/core/services/db_service.dart';
import 'package:bati_turbo_erp/viewmodels/base_model.dart';
import 'package:bati_turbo_erp/models/customers.dart';
import 'package:get_it/get_it.dart';

class CustomerModel extends BaseModel {

  final FirestoreDB _db = GetIt.instance<FirestoreDB>();

  Stream<List<Customer>> customers(String userId) {
    return _db.getCustomer(userId);
  }
}