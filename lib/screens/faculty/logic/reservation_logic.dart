import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/controller/professor_controller.dart';
import 'package:appdevelopment/screens/faculty/models/model.dart';

import '../ui/home_professor_page.dart';

class ReservationLogic {
  final ReservationController _reservationController = ReservationController();

  Widget buildReservationList() {
    return FutureBuilder<List<Reservation>>(
      future: _reservationController.getReservations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error retrieving reservations'),
          );
        } else {
          final reservations = snapshot.data ?? [];
          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              return ReservationCard(reservation: reservations[index]);
            },
          );
        }
      },
    );
  }
}