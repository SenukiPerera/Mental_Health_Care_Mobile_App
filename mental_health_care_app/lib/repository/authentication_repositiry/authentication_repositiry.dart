import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/Exceptions/signup_email_password_failure.dart';
import 'package:mental_health_care_app/welcome/welcome_screen.dart';
import 'package:mental_health_care_app/firebase_options.dart';

class AuthenticationRepositiry extends GetxController {
  static AuthenticationRepositiry get instance => Get.find();

  //variables
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rxn<User> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("User created successfully");
      // No need to navigate here, onReady listener will handle it.
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      rethrow;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
