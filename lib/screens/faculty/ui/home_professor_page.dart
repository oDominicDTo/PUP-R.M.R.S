import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appdevelopment/screens/faculty/models/retrieve_reservation_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/faculty/utils/color_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              currentDate,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xF0F0F0F0),
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
                // Accessing the color directly
                DateTime initialDateTime = reservation.initialTime.toDate();
                DateTime finalDateTime = reservation.finalTime.toDate();

                String formattedInitialTime = DateFormat('h:mm a').format(initialDateTime);
                String formattedFinalTime = DateFormat('h:mm a').format(finalDateTime);
                String? courseColorString = reservation.courseColor;
                Color? courseColor = ColorUtils.stringToColor(courseColorString);


                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          color: courseColor ?? Colors.transparent,// Use the color directly
                          width: 10,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text('${reservation.roomName ?? 'N/A'}',
                        style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${reservation.subjectName ?? 'N/A'}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text('${reservation.courseName ?? 'N/A'}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                const SizedBox(height: 5),
                Container(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 15,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$formattedInitialTime - $formattedFinalTime',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                  ),
                ),
                ]),
                ),
                        ],
                      ),
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