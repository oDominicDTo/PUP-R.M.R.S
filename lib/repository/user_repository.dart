import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/models/user_model.dart';

class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

createUser(UserModel user) async{
 await _db.collection("Users").add(user.toJson());
}

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
  Future<List<UserModel>> allDetails() async {
    final snapshot = await _db.collection("users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
  Future<String?> getUserType(String userId) async {
    try {
      final snapshot = await _db.collection("users").doc(userId).get();
      final userType = snapshot.data()?['userType'] as String?;
      return userType;
    } catch (e) {
      print("Failed to retrieve userType: $e");
      return null;
    }
  }
}