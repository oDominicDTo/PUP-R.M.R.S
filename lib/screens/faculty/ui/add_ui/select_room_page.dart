import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

import '../../utils/selection_variables.dart';

class SelectRoomPage extends StatelessWidget {
  final String subjectId;
  final String professorId;

  const SelectRoomPage({
    Key? key,
    required this.subjectId,
    required this.professorId,
  }) : super(key: key);

  void _showConfirmationDialog(BuildContext context, Room room) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text('Are you sure you want to reserve at ${room.roomName}?'),
          actions: [
            TextButton(
              child: const Text('Yes'),
              onPressed: () {

                _addReservation(room);

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }

  void _addReservation(Room room) {
    final firestore = FirebaseFirestore.instance;
    final reservationsCollection = firestore.collection('reservations');

    // Create a new document in the reservations collection with auto-generated ID
    final reservationDoc = reservationsCollection.doc();

    // Set the reservation data
    reservationDoc.set({
      'buildingId': SelectedBuilding.buildingId,
      'floorId': SelectedFloor.floorId,
      'roomId': room.roomId,
      'subjectId': subjectId,
      'professorId': professorId,
      'reservationDate': DateTime.now(), // Add the current date and time
      // Add other reservation details as needed
    }).then((_) {
      // Reservation added successfully
      print('Reservation added successfully');
    }).catchError((error) {
      // Error occurred while adding the reservation
      print('Error adding reservation: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      body: FutureBuilder<List<Room>>(
        future: FirestoreUtils.getAvailableRooms(
          SelectedBuilding.buildingId!,
          SelectedFloor.floorId!,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error retrieving rooms'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final rooms = snapshot.data!;
            if (rooms.isEmpty) {
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
          } else {
            return const Center(
              child: Text('No available rooms found'),
            );
          }
        },
      ),
    );
  }
}
