import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot.id,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNo: data['phoneNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phoneNo": phoneNo,
    };
  }
}
