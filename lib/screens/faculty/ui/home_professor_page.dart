import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/models/reservation_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      final professorId = user!.uid;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Reservation History'),
        ),
        body: FutureBuilder<List<Reservation>>(
          future: FirestoreUtils.getReservationsByProfessorAndDate(professorId, DateTime.now()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error retrieving reservations'),
              );
            } else {
              final reservations = snapshot.data ?? [];

              if (reservations.isEmpty) {
                return const Center(
                  child: Text('No reservations found'),
                );
              }

              return ListView.builder(
                itemCount: reservations.length,
                itemBuilder: (context, index) {
                  final reservation = reservations[index];
                  return ListTile(
                    title: Text(reservation.roomName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subject: ${reservation.subject}'),
                        Text('Course: ${reservation.course}'),
                        Text('Time: ${reservation.initialTime} - ${reservation.finalTime}'),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    } else {
      // Handle the case when the user is not logged in
      return Scaffold(
        appBar: AppBar(
          title: const Text('Reservation History'),
        ),
        body: Center(
          child: Text('User not logged in'),
        ),
      );
    }
  }
}
