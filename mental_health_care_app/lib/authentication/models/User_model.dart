import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNo: data['phoneNo'] ?? '',
      password: data['password'] ?? '',
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

  //fetch data from firestore
  /* factory UserModel.formSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: snapshot.id,
      email: data["Email"],
      password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
    );
  }*/
}
