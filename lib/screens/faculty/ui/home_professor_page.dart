import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/retrieve_reservation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: user != null
          ? StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('reservations')
            .where('professorId', isEqualTo: user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final reservationDocs = snapshot.data!.docs;
            if (reservationDocs.isEmpty) {
              return const Center(
                child: Text('No upcoming reservations'),
              );
            }
            return ListView.builder(
              itemCount: reservationDocs.length,
              itemBuilder: (context, index) {
                final reservation = Reservation.fromSnapshot(reservationDocs[index]);
                return Card(
                  child: ListTile(
                    title: Text('Room Name: ${reservation.roomName ?? 'N/A'}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subject Name: ${reservation.subjectName ?? 'N/A'}'),
                        Text('Course Name: ${reservation.courseName ?? 'N/A'}'),
                        Text('Start Time: ${reservation.initialTime.toDate()}'),
                        Text('End Time: ${reservation.finalTime.toDate()}'),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error fetching reservations'),
            );
          }
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
