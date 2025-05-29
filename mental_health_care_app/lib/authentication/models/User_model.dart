import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? password; // Optional, if you want to store it

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.password,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot.id,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNo: data['phoneNo'] ?? '',
      password: data['password'], // Optional, if you want to store it
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phoneNo": phoneNo,
      "password": password,
    };
  }
}
