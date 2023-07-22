import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appdevelopment/screens/faculty/models/retrieve_reservation_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

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
          ? FutureBuilder<List<RetrieveReservation>>(
        future: FirestoreUtils.getReservationsForProfessor(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final reservations = snapshot.data!;
            if (reservations.isEmpty) {
              return const Center(
                child: Text('No Reservations'),
              );
            }
            return ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final reservation = reservations[index];
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
