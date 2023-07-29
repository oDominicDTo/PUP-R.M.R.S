import 'package:appdevelopment/models/retrieve_reservation_model.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import '../../../../main.dart';
import '../../utils/selection_variables.dart';

class SelectRoomPage extends StatelessWidget {
  final String subjectId;
  final String professorId;
  final String courseId;
  final DateTime selectedInitialTime; // Add selectedInitialTime parameter
  final DateTime selectedFinalTime;

  const SelectRoomPage({
    Key? key,
    required this.subjectId,
    required this.professorId,
    required this.courseId,
    required this.selectedInitialTime, // Add selectedInitialTime parameter
    required this.selectedFinalTime,
  }) : super(key: key);

  void _showConfirmationDialog(BuildContext context, Room room) async {
    try {
      final reservationsSnapshot = await FirebaseFirestore.instance
          .collection('reservations')
          .where('roomName', isEqualTo: room.roomName)
          .get();

      final reservations = reservationsSnapshot.docs.map((doc) =>
          RetrieveReservation.fromSnapshot(doc)).toList();

      final result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text('Are you sure you want to reserve ${room.roomName}?'),
            actions: [
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(
                      true); // Return true if the user confirms
                },
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(
                      false); // Return false if the user cancels
                },
              ),
            ],
          );
        },
      );

      if (result == true) {
        final isAvailable = room.isAvailable(
          selectedInitialTime,
          selectedFinalTime,
          reservations,
          currentDate: DateTime.now(), // Pass the current date here
        );

        if (isAvailable) {
          _addReservation(context, room);
        } else {
          _showSnackBar(context, 'Room not available for the selected time');
        }
      }
    } catch (error) {
      _showSnackBar(context, 'Error fetching reservations: $error');
    }
  }


  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _addReservation(BuildContext context, Room room) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final reservationsCollection = firestore.collection('reservations');

      // Gather additional information from Firestore
      final subject = await FirestoreUtils.getSubjectByCourseAndSubjectId(
          courseId, subjectId);
      final course = await FirestoreUtils.getCourseById(courseId);
      final currentDate = DateTime.now();
      final startOfDay = DateTime(
          currentDate.year, currentDate.month, currentDate.day);
      final endOfDay = startOfDay.add( const Duration(days: 1));

      final existingReservation = await reservationsCollection
          .where('subjectName', isEqualTo: subject.subjectName)
          .where('reservationDate', isGreaterThanOrEqualTo: startOfDay)
          .where('reservationDate', isLessThan: endOfDay)
          .limit(1)
          .get();

      if (existingReservation.docs.isEmpty) {
        // Create a new document in the reservations collection with auto-generated ID
        final reservationDoc = reservationsCollection.doc();

// Convert DateTime to Timestamp
        final reservationDateTimestamp = Timestamp.fromDate(DateTime.now());

// Set the reservation data
        await reservationDoc.set({
          'subjectName': subject.subjectName,
          'professorId': professorId,
          'roomName': room.roomName,
          'courseName': course.courseName,
          'courseColor': course.courseColor,
          'initialTime': subject.initialTime,
          'finalTime': subject.finalTime,
          'reservationDate': reservationDateTimestamp,
          // Store reservationDate as a Timestamp
          'status': 'Upcoming',
          'roomStatus': 'Pending',
          // Add the current date and time
          // Add other reservation details as needed
        });

        // Reservation added successfully
        _showSnackBar(context, 'Reservation added successfully');

        // Navigate back to the HomeProfessorPage after adding the reservation
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ProfPage()),
              (route) => false,
        );
      } else {
        _showSnackBar(context, 'A reservation for this subject already exists');
      }
    } catch (error) {
      // Handle any errors from Firestore queries
      _showSnackBar(context, 'Error adding reservation: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                color: Colors.grey,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        child: Container(
                          color: const Color(0xFF5B0101),
                          height: 0.2 * MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.15,
                left: 20,
                right: 20,
                bottom: constraints.maxHeight * 0.22,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "Choose Room",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection('buildings')
                                .doc(SelectedBuilding.buildingId)
                                .collection('floors')
                                .doc(SelectedFloor.floorId)
                                .collection('rooms')
                                .where('available', isEqualTo: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text('Error retrieving rooms'),
                                );
                              }

                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final rooms = snapshot.data?.docs.map((doc) => Room.fromSnapshot(doc)).toList();

                              if (rooms == null || rooms.isEmpty) {
                                return const Center(
                                  child: Text('No available rooms found'),
                                );
                              }

                              return ListView.builder(
                                itemCount: rooms.length,
                                itemBuilder: (context, index) {
                                  final room = rooms[index];
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ListTile(
                                      title: Text(room.roomName,textAlign: TextAlign.center,),
                                      onTap: () {
                                        _showConfirmationDialog(context, room);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}