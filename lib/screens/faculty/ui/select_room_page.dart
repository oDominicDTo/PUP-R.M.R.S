import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:appdevelopment/screens/faculty/ui/add_reservation_page.dart';

import '../utils/selection_variables.dart';

class SelectRoomPage extends StatelessWidget {
  const SelectRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      body: FutureBuilder<List<Room>>(
        future: FirestoreUtils.getAvailableRooms(
          SelectedBuilding.buildingId ?? '',
          SelectedFloor.floorId ?? '',
          SelectedCourse.courseId ?? '',
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
          } else {
            final rooms = snapshot.data ?? [];
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(rooms[index].roomName),
                  onTap: () {
                    SelectedRoom.roomId = rooms[index].roomId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddReservationPage()),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
