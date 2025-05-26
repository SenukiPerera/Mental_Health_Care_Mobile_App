import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:mental_health_care_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepositiry());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    // Fetch user data from the repository and update the controllers
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
