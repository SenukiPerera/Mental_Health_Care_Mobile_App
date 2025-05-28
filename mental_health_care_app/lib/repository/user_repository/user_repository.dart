import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw "User ID is null";

      print("📝 Saving user to Firestore with UID: $uid");

      await _db.collection("Users").doc(uid).set(user.toJson());

      Get.snackbar("Success", "User saved in database",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (e) {
      print("Error saving user to Firestore: $e");
      Get.snackbar("Error", "User not saved",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  //fetch details of user
  Future<UserModel?> getUserDetails(String uid) async {
    try {
      final snapshot = await _db.collection("Users").doc(uid).get();

      if (!snapshot.exists) {
        throw Exception("User document does not exist");
      }

      return UserModel.fromSnapshot(snapshot);
    } catch (e) {
      throw Exception("Failed to get user details: $e");
    }
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
