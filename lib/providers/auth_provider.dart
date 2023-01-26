import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/utils/constants.dart';

import '../models/user_model.dart';
import '../utils/init_shared_prefs.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var isLoading = false;

  Future<void> logIn(String email, String password) async {
    try {
      isLoading = true;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        _isUserLoggedIn(true);
        isLoading = false;
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e.message!;
    }
  }

  Future<void> signUp(UserModel user, String password) async {
    try {
      isLoading = true;
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await _db.collection(kUsers).doc(result.user?.uid).set(
        {
          'username': user.username,
          'email': user.email,
          'userId': result.user?.uid,
        },
      ).then((value) {
        _isUserLoggedIn(true);
        isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e.message!;
    }
  }

  User? currentUser() {
    _auth.currentUser?.reload();
    return _auth.currentUser;
  }

  Future<void> updateUsername(String name) async {
    isLoading = true;
    try {
      await _auth.currentUser?.reload();
      final String? userId = _auth.currentUser?.uid;
      await _db
          .collection(kUsers)
          .doc(userId)
          .update({'username': name}).then((value) {
        isLoading = false;
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e.message!;
    }
  }

  Future<void> signOut() async {
    isLoading = true;
    try {
      await _auth.signOut().then((value) {
        _isUserLoggedIn(false);
        isLoading = false;
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e.message!;
    }
  }

  void _isUserLoggedIn(bool status) async {
    await prefs.setBool(kIsLoggedIn, status);
  }
}
