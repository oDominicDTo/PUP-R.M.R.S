import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/retrieve_reservation_model.dart';
class FireStoreUtilsForGuard{

  static Future<List<RetrieveReservation>> getAllReservationsForGuard() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('reservations')
          .get();

      final reservationDocs = snapshot.docs;
      final reservations = reservationDocs.map((doc) => RetrieveReservation.fromSnapshot(doc)).toList();

      return reservations;
    } catch (error) {
      // You can handle the error here or throw it to be handled elsewhere
      throw Exception('Error fetching reservations: $error');
    }
  }
  static Future<List<RetrieveReservation>> getAllReservationsCurrentForGuard() async {
    try {
      final DateTime currentDate = DateTime.now();
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('reservations').get();

      final reservations = snapshot.docs
          .map((doc) => _convertToReservation(doc))
          .where((reservation) {
        // Convert the reservationDate timestamp to DateTime
        final Timestamp reservationDateTimestamp = reservation.reservationDate;
        final DateTime reservationDate = reservationDateTimestamp.toDate();

        // Compare only the date (year, month, and day) without considering the time
        return currentDate.year == reservationDate.year &&
            currentDate.month == reservationDate.month &&
            currentDate.day == reservationDate.day;
      }).toList();

      return reservations;
    } catch (error) {
      // You can handle the error here or throw it to be handled elsewhere
      throw Exception('Error fetching reservations: $error');
    }
  }
  static RetrieveReservation _convertToReservation(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final id = doc.id; // Get the document ID

    return RetrieveReservation(
      id: id,
      subjectName: data['subjectName'],
      courseName: data['courseName'],
      initialTime: data['initialTime'],
      finalTime: data['finalTime'],
      roomName: data['roomName'],
      courseColor: data['courseColor'],
      reservationDate: data['reservationDate'],
      professorId: data['professorId'],
      status: data['status'],
      roomStatus: data['roomStatus'],
    );
  }
}