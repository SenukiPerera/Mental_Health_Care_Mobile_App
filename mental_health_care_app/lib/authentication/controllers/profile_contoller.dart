import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:mental_health_care_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepositiry());
  final _userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    getUserData(); // Automatically refresh when initialized
  }

  getUserData() {
    final uid = _authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      return _userRepo.getUserDetails(uid); // Pass UID
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
