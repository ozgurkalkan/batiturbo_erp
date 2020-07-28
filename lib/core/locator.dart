import 'package:bati_turbo_erp/core/services/aut_service.dart';
import 'package:bati_turbo_erp/core/services/db_service.dart';
import 'package:bati_turbo_erp/core/services/navigator_service.dart';
import 'package:bati_turbo_erp/viewmodels/customer_model.dart';
import 'package:bati_turbo_erp/viewmodels/main_model.dart';
import 'package:bati_turbo_erp/viewmodels/sign_in_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupLocators() {

  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => FirestoreDB());
  getIt.registerLazySingleton(() => AuthService());

  getIt.registerFactory(() => MainModel);
  getIt.registerFactory(() => CustomerModel());
  getIt.registerFactory(() => SignInModel());
}