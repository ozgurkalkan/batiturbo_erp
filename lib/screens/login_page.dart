import 'package:bati_turbo_erp/core/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/sign_in_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State < LoginPage > {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt < SignInModel > (),
      child: Consumer < SignInModel > (
        builder: (BuildContext context, SignInModel model, Widget child) =>

        Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
              child: model.busy
              ? CircularProgressIndicator()
              : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  FlutterLogo(size: 150),
                  SizedBox(height: 50),
                  OutlineButton(
                    splashColor: Colors.grey,
                    onPressed: () async =>await model.signIn(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: < Widget > [
                              Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                              )
                            ],
                          ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}