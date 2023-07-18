import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String roomId;
  final String roomName;
  final bool available;

  Room({
    required this.roomId,
    required this.roomName,
    required this.available,
  });

  factory Room.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Room(
      roomId: snapshot.id,
      roomName: data['roomName'],
      available: data['available'],
    );
  }
}