import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfield Controllers
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  //signup_function
  Future<bool> registerUser() async {
    try {
      await AuthenticationRepositiry.instance.createUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Set display name in Firebase Auth
    await FirebaseAuth.instance.currentUser?.updateDisplayName(fullName.text.trim());
      print("Registration successful");
      
      return true;
    } catch (e) {
      print("Registration failed: $e");
      return false;
    }
  }
}
