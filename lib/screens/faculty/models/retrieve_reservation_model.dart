import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveReservation {
  final String id; // Add the document ID field
  final String? subjectName;
  final String? courseName;
  late final Timestamp initialTime;
  late final Timestamp finalTime;
  final String? roomName;
  final String? courseColor;
  final Timestamp reservationDate;

  RetrieveReservation({
    required this.id, // Add the document ID parameter to the constructor
    this.subjectName,
    this.courseName,
    required this.initialTime,
    required this.finalTime,
    this.roomName,
    this.courseColor,
    required this.reservationDate,
  });

  factory RetrieveReservation.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return RetrieveReservation(
      id: snapshot.id, // Assign the document ID
      subjectName: data['subjectName'],
      courseName: data['courseName'],
      initialTime: data['initialTime'],
      finalTime: data['finalTime'],
      roomName: data['roomName'],
      courseColor: data['courseColor'],
      reservationDate: data['reservationDate'],
    );
  }
}
