import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireHelper {
  //Auth
  final auth_instance = FirebaseAuth.instance;

  Future<void> signIn(String email, String pwd) async {
    try {
      final User? user = (await auth_instance.signInWithEmailAndPassword(
              email: email, password: pwd))
          .user;

      print(user);
    } catch (e) {
      print("Error MGJ");
    }
  }
}
