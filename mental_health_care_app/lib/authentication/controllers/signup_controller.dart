import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_care_app/authentication/models/user_model.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:mental_health_care_app/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<bool> registerUser() async {
    try {
      await AuthenticationRepositiry.instance.createUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(fullName.text.trim());

      print("Firebase registration successful");
      return true;
    } catch (e) {
      print("Registration failed: $e");
      return false;
    }
  }

  Future<void> signupUser() async {
    try {
      final isRegistered = await registerUser();
      if (isRegistered) {
        final user = UserModel(
          email: email.text.trim(),
          password: password.text.trim(),
          fullName: fullName.text.trim(),
          phoneNo: phone.text.trim(),
        );

        await userRepo.createUser(user);
        print("User saved in Firestore");

        // Navigate
        print("➡️ Navigating to /HomeScreen");
        Get.offAllNamed('/HomeScreen');
      }
    } catch (e) {
      print("signupUser failed: $e");
      Get.snackbar("Error", "Something went wrong.");
    }
  }
}
