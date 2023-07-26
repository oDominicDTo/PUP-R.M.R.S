import 'package:appdevelopment/screens/faculty/ui/home_professor_page.dart';
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

  const SelectRoomPage({
    Key? key,
    required this.subjectId,
    required this.professorId,
    required this.courseId,
  }) : super(key: key);

  void _showConfirmationDialog(BuildContext context, Room room) async {
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
                Navigator.of(context).pop(true); // Return true if the user confirms
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false); // Return false if the user cancels
              },
            ),
          ],
        );
      },
    );

    if (result == true) {
      _addReservation(context, room);
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
      final subject = await FirestoreUtils.getSubjectByCourseAndSubjectId(courseId, subjectId);
      final course = await FirestoreUtils.getCourseById(courseId);

      // Create a new document in the reservations collection with auto-generated ID
      final reservationDoc = reservationsCollection.doc();

      // Set the reservation data
      await reservationDoc.set({
        'subjectName': subject.subjectName,
        'professorId': professorId,
        'roomName': room.roomName,
        'courseName': course.courseName,
        'courseColor': course.courseColor,
        'initialTime': subject.initialTime,
        'finalTime': subject.finalTime,
        'reservationDate': DateTime.now(), // Add the current date and time
        // Add other reservation details as needed
      });

      // Reservation added successfully
      _showSnackBar(context, 'Reservation added successfully');

      // Navigate back to the HomeProfessorPage after adding the reservation
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ProfPage()),
            (route) => false,
      );
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
              return ListTile(
                title: Text(room.roomName),
                onTap: () {
                  _showConfirmationDialog(context, room);
                },
              );
            },
          );
        },
      ),
    );
  }
}
