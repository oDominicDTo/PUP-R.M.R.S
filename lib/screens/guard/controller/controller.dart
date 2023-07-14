import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/guard/models/room.dart';

class UserController {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<List<User>> getProfessors() async {
    QuerySnapshot snapshot = await usersCollection.where('userType', isEqualTo: 'professor').get();
    List<User> professors = [];

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      professors.add(User(
        id: doc.id,
        name: doc['displayName'],
        email: doc['email'],
        userType: doc['userType'],
      ));
    }

    return professors;
  }
}
