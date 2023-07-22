import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';

class UserRepository {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

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
