import 'package:cloud_firestore/cloud_firestore.dart';

import '../../faculty/models/retrieve_reservation_model.dart';

   Future<List<RetrieveReservation>> getAllReservationsForGuard(String professorId) async {
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

