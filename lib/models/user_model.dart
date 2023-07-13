import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  final String? id;
  final String fullName;
  final String email;



const UserModel({

    this.id,
  required this.email,
  required this.fullName,
});

toJson(){
return {"Fullname": fullName, "Email": email,};

}

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  final data = document.data()!;
  return UserModel(
    id: document.id,
      email: data["Email"],
      fullName: data["FullName"]);
}
}
