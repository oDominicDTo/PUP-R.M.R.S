// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/models/another_reservation_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
/*    if (user != null) {
      final professorId = user!.uid;*/
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ));
    /* body: StreamBuilder<List<ReservationModel>>(
          stream: FirestoreUtils.getReservationsByProfessorId(professorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error retrieving reservations'),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              final reservations = snapshot.data!;
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
                    title: Text('Room: ${reservation.roomName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subject: ${reservation.subjectName}'),
                        // Add more details as needed
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No reservations found'),
              );
            }
          },
        ),
      );
    } else {
      return const Center(
        child: Text('User not found'),
      );
    }
  }*/
  }}