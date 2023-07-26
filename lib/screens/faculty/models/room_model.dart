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

  bool isAvailable(DateTime selectedInitialTime, DateTime selectedFinalTime, List<Map<String, dynamic>> reservations) {
    final initialTime = selectedInitialTime;
    final finalTime = selectedFinalTime;

    for (final reservation in reservations) {
      final reservationInitialTime = reservation['initialTime'].toDate();
      final reservationFinalTime = reservation['finalTime'].toDate();

      // Check for conflicts
      if ((initialTime.isBefore(reservationFinalTime) && finalTime.isAfter(reservationInitialTime)) ||
          (initialTime.isAtSameMomentAs(reservationFinalTime) || finalTime.isAtSameMomentAs(reservationInitialTime))) {
        return false; // Room is not available
      }
    }

    return true; // Room is available
  }
}
class User {
  final String id;
  final String name;
  final String email;
  final String userType;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.imageUrl,
  });
}