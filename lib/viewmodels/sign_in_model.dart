import 'package:bati_turbo_erp/core/locator.dart';
import 'package:bati_turbo_erp/core/services/aut_service.dart';
import 'package:bati_turbo_erp/viewmodels/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignInModel extends BaseModel{

  final AuthService _authService = getIt<AuthService>();
  final Firestore _firestore = Firestore.instance;
  

  Future <FirebaseUser> get currentUser => _authService.currentUser;

  Future<void> signIn() async{
    
    busy = true;

    try {
      var user = await _authService.signInWithGoogle();
      await _firestore.collection("profile").document(user.uid).setData({
        'userName': user.displayName,
        'userImage': user.photoUrl,
        "userPhone": user.phoneNumber
        }
      );
      print(user.uid);

    } catch(e) {
      busy = false;
    }
    busy = false;
  }
  
  
}