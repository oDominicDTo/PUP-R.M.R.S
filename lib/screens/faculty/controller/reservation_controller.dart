import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/reservation_model.dart';

class ReservationController {
  Future<void> addReservation(Reservation reservation) async {
    try {
      final reservationRef =
      FirebaseFirestore.instance.collection('reservations');
      await reservationRef.add({
        'roomName': reservation.roomName,
        'subject': reservation.subject,
        'course': reservation.course,
        'initialTime': reservation.initialTime,
        'finalTime': reservation.finalTime,
        'courseColor': reservation.courseColor.value.toString(),
      });
      print('Reservation added successfully');
    } catch (error) {
      print('Error adding reservation: $error');
    }
  }

  Future<List> fetchReservationsByProfessorId(
      String professorId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('reservations')
          .where('professorId', isEqualTo: professorId)
          .get();
      return querySnapshot.docs
          .map((doc) => Reservation.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching reservations: $error');
      return [];
    }
  }
}
