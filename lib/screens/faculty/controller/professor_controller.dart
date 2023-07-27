import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/model.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import 'package:appdevelopment/screens/faculty/repository/prof_repository.dart';
class ReservationController {
  final CollectionReference _reservationCollection =
  FirebaseFirestore.instance.collection('reservations');


  Future<List<Reservation>> getReservations() async {
    final querySnapshot = await _reservationCollection.get();
    final reservations = querySnapshot.docs
        .map((doc) => Reservation.fromSnapshot(doc))
        .toList();
    return reservations;
  }
  UserRepository _userRepository = UserRepository();
  User? currentUser;

  Future<void> loadUserData() async {
    final user = await AuthenticationRepository.instance.getCurrentUser();
    if (user != null) {
      final userId = user.uid;
      currentUser = await _userRepository.getUserDetails(userId);
    }
  }

}
