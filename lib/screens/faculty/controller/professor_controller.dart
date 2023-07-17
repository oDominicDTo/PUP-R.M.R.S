import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/model.dart';

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
}
