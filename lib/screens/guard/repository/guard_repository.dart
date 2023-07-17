import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/guard/models/room.dart';

class UserRepository {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<List<User>> getProfessors() async {
    QuerySnapshot snapshot = await usersCollection.where('userType', isEqualTo: 'professor').get();
    List<User> professors = [];

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      professors.add(User(
        id: doc.id,
        name: doc['displayName'],
        email: doc['email'],
        userType: doc['userType'],
        imageUrl: '',
      ));
    }

    return professors;
  }

  Future<User> getUserDetails(String userId) async {
    final userDoc = await usersCollection.doc(userId).get();
    final userData = userDoc.data() as Map<String, dynamic>;

    return User(
      id: userDoc.id,
      name: userData['displayName'] as String? ?? '',
      email: userData['email'] as String? ?? '',
      userType: userData['userType'] as String? ?? '',
      imageUrl: '',
    );
  }
}
