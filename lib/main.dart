import 'package:bati_turbo_erp/core/services/navigator_service.dart';
import 'package:bati_turbo_erp/screens/login_page.dart';
import 'package:bati_turbo_erp/screens/main_screen.dart';
import 'package:bati_turbo_erp/viewmodels/sign_in_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'core/locator.dart';
import 'package:flutter/material.dart';



void main() {
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (BuildContext context) => getIt<SignInModel>().currentUser,
      child: MaterialApp(
        title: 'WhatsApp Clone',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          primaryColor: Color(0xff075E54),
          accentColor: Color(0xff25D366),
        ),
        home: Consumer<FirebaseUser>(
          builder: (BuildContext context, FirebaseUser user, Widget child) =>
          user == null ?  LoginPage() : MainScreen() ,
        ),
      ),
    );
  }
}