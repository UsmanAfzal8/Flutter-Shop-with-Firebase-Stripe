import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Googlesignin extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future Googlelogin() async {
    final googlesignin = GoogleSignIn();
    final googleuser = await googlesignin.signIn();
    if (googleuser == null) return;
    _user = googleuser;
    final googleauth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken, idToken: googleauth.idToken);
    await _auth.signInWithCredential(credential);
    notifyListeners();
  }
}
