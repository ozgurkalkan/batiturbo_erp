import 'package:bati_turbo_erp/screens/add_customer_page.dart';
import 'package:bati_turbo_erp/screens/main_screen.dart';
import 'package:bati_turbo_erp/viewmodels/base_model.dart';

class MainModel extends BaseModel {

  Future<void> navigateToCustomerAdd() {
    return navigatorService.navigateTo(AddCustomerPage());
  }  
}