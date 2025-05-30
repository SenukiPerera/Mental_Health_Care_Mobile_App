import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_care_app/authentication/models/user_model.dart';
import 'package:mental_health_care_app/repository/authentication_repositiry/authentication_repositiry.dart';
import 'package:mental_health_care_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepositiry());
  final _userRepo = Get.put(UserRepository());

  // Form Controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive user data and loading state
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    isLoading.value = true;
    try {
      final uid = _authRepo.firebaseUser.value?.uid;
      if (uid == null) {
        Get.snackbar("Error", "User ID not found. Please login again.");
        isLoading.value = false;
        return;
      }

      final userData = await _userRepo.getUserDetails(uid);
      if (userData == null) {
        Get.snackbar("Error", "User data not found.");
        isLoading.value = false;
        return;
      }

      currentUser.value = userData;

      fullNameController.text = userData.fullName;
      emailController.text = userData.email;
      phoneController.text = userData.phoneNo;
      passwordController.text = userData.password ?? '';
    } catch (e) {
      Get.snackbar("Error", "Failed to load user data: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserData() async {
    try {
      final uid = _authRepo.firebaseUser.value?.uid;
      if (uid == null) {
        Get.snackbar("Error", "User not logged in");
        return;
      }

      final updatedUser = UserModel(
        id: uid,
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNo: phoneController.text.trim(),
        password: passwordController.text.trim(),
      );

      await _userRepo.createUser(updatedUser); // Save updated info

      Get.snackbar("Success", "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);

      // Update current user reactive variable so UI updates if needed
      currentUser.value = updatedUser;
    } catch (e) {
      Get.snackbar("Error", "Profile update failed: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
}
