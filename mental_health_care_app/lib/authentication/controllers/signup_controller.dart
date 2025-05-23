import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/exceptions/signup_email_password_failure.dart';

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
      print("Registration successful");
      return true;
    } catch (e) {
      print("Registration failed: $e");
      return false;
    }
  }
}
