import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

import '../../utils/selection_variables.dart';

class SelectRoomPage extends StatelessWidget {
  const SelectRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      body: FutureBuilder<List<Room>>(
        future: FirestoreUtils.getAvailableRooms( SelectedBuilding.buildingId!,
          SelectedFloor.floorId!,),
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
                    // Perform the desired action when a room is selected
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
