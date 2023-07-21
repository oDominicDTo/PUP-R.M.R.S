import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String id;
  final String buildingId;
  final String floorId;
  final String professorId;
  final Timestamp reservationDate;
  final String roomId;
  final String subjectId;
  final String? subjectName; // Use String? to handle nullable values
  final String courseId;
  final String? courseName; // Use String? to handle nullable values
  final Timestamp initialTime;
  final Timestamp finalTime;
  final String? roomName; // Use String? to handle nullable values

  Reservation({
    required this.id,
    required this.buildingId,
    required this.floorId,
    required this.professorId,
    required this.reservationDate,
    required this.roomId,
    required this.subjectId,
    this.subjectName, // Make subjectName nullable
    required this.courseId,
    this.courseName, // Make courseName nullable
    required this.initialTime,
    required this.finalTime,
    this.roomName, // Make roomName nullable
  });

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      id: snapshot.id,
      buildingId: data['buildingId'],
      floorId: data['floorId'],
      professorId: data['professorId'],
      reservationDate: data['reservationDate'],
      roomId: data['roomId'],
      subjectId: data['subjectId'],
      subjectName: data['subjectName'],
      courseId: data['courseId'],
      courseName: data['courseName'],
      initialTime: data['initialTime'],
      finalTime: data['finalTime'],
      roomName: data['roomName'],
    );
  }
}
