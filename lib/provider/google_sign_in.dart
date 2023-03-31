import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future GoogleLogin() async {
    try {
      final googleUSer = await googleSignIn.signIn();
      if (googleUSer == null) return;
      _user = googleUSer;

      final googleAuth = await googleUSer.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("fuck you");
      print(e.toString());
    }

    notifyListeners();
  }

    Future logout() async{
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
}