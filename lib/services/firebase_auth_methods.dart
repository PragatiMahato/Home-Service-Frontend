// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screen/services.dart';

import '../CustomWidget/showsneakbar.dart';
import '../Screen/login.dart';

class FirebaseAuthMethod {
  late final FirebaseAuth _auth;
  FirebaseAuthMethod(this._auth);
  User get user => _auth.currentUser!;
  // late final TextEditingController _emailcontroller;
  // late final TextEditingController _passwordcontroller;
  // late final TextEditingController _usernamecontroller;
  // late final TextEditingController _callcontroller;

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String userName,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailVerification(context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }), (route) => false);

      final users = <String, dynamic>{
        'full name': userName,
        'email': email,
        'phone': phone,
        'password': password
      };
      FirebaseFirestore.instance.collection('User').doc().set(users);
      // .onError((e, _) => print('errro:$e'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const HomePage();
      }), (route) => false);
      // if (!user.emailVerified) {
      //   await sendEmailVerification(context);
      // }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSnackBar(context, "Email verification sent for rest password");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
