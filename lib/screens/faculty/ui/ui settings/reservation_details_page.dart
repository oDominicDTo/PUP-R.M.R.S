import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/retrieve_reservation_model.dart';

class ReservationDetailsPage extends StatelessWidget {
  final RetrieveReservation reservation;

  const ReservationDetailsPage({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B0101), // Set the background color to dark red
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF5B0101),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Container(
          width: 360,
          height: 380,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              Text(
                reservation.roomName ?? 'N/A',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4),
              const Divider( // Add a divider below the room name
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Text(
                reservation.subjectName ?? 'N/A',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                reservation.courseName ?? 'N/A',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                ' ${DateFormat('h:mm a').format(reservation.initialTime.toDate())} - ${DateFormat('h:mm a').format(reservation.finalTime.toDate())}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
