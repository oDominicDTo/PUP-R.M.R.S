import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String id;
  final String? subjectName; // Use String? to handle nullable values
  final String? courseName; // Use String? to handle nullable values
  final Timestamp initialTime;
  final Timestamp finalTime;
  final String? roomName; // Use String? to handle nullable values

  Reservation({
    required this.id,
    this.subjectName, // Make subjectName nullable
    this.courseName, // Make courseName nullable
    required this.initialTime,
    required this.finalTime,
    this.roomName, // Make roomName nullable
  });

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      id: snapshot.id,
      subjectName: data['subjectName'],
      courseName: data['courseName'],
      initialTime: data['initialTime'],
      finalTime: data['finalTime'],
      roomName: data['roomName'],
    );
  }
}
