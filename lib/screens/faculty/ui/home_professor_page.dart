import 'package:appdevelopment/screens/faculty/ui/ui%20settings/reservation_details_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appdevelopment/screens/faculty/models/retrieve_reservation_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/faculty/utils/color_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:appdevelopment/screens/faculty/utils/confirmation_dialog.dart';

import '../widgets/modify_dialog.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  List<RetrieveReservation> reservations = [];

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

                return InkWell(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReservationDetailsPage(reservation: reservation),
                    ),
                  );
                },
                child: Card(
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
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Modify',
                            onPressed: (BuildContext context) {
                              _showModifyDialog(reservation);
                            },
                          ),

                          SlidableAction(
                            backgroundColor: Colors.red.shade800,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_forever,
                            label: 'Delete',
                            onPressed: (BuildContext context) {
                              _deleteReservation(reservation);
                              },
                          ),
                        ],
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
                        dense: false,
                      ),
                    ),
                  ),
                ));
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
  void _deleteReservation(RetrieveReservation reservation) async {
    await showConfirmationDialog(
      context,
      'Confirm Delete',
      'Are you sure you want to delete this reservation?',
          () => _deleteReservationConfirmed(reservation),
    );
  }

  void _deleteReservationConfirmed(RetrieveReservation reservation) async {
    String documentId = reservation.id;
    await FirestoreUtils.deleteReservation(documentId);
    setState(() {
      reservations.remove(reservation);
    });
  }
  void _showModifyDialog(RetrieveReservation reservation) async {
    // ... Other existing code ...

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModifyDialog(
          reservation: reservation,
          onSave: (modifiedReservation) {
            // Update the local reservation list in the home page with the modified reservation
            setState(() {
              int index = reservations.indexWhere((r) => r.id == modifiedReservation.id);
              if (index != -1) {
                reservations[index] = modifiedReservation;
              }
            });
          },
        );
      },
    );
  }
}