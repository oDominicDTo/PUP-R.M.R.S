import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/reservation_model.dart';

class ReservationController {
  final CollectionReference reservationCollection =
  FirebaseFirestore.instance.collection('reservations');

  Future<void> addReservation(Reservation reservation) {
    return reservationCollection.add(reservation.toMap());
  }
}
