import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String userType;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.userType,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      displayName: data['displayName'],
      userType: data['userType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'userType': userType,
    };
  }
}
