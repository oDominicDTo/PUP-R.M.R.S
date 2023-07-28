import 'package:cloud_firestore/cloud_firestore.dart';

enum ReservationStatus {
  Upcoming,
  Ongoing,
  Done,
}

class RetrieveReservation {
  final String id; // Add the document ID field
  final String? subjectName;
  final String? courseName;
  late Timestamp initialTime;
  late Timestamp finalTime;
  final String? roomName;
  final String? courseColor;
  final Timestamp reservationDate;
  final String professorId;
  String professorName; // Add the professorName property
  ReservationStatus status; // Add the status property

  RetrieveReservation({
    required this.id, // Add the document ID parameter to the constructor
    this.subjectName,
    this.courseName,
    required this.initialTime,
    required this.finalTime,
    required this.roomName,
    this.courseColor,
    required this.reservationDate,
    required this.professorId,
    this.professorName = '', // Initialize the professorName property with an empty string
    this.status = ReservationStatus.Upcoming, // Set the default status to 'upcoming'
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
      professorId: data['professorId'],
    );
  }

  // Add the copyWith method to update the professorName and status properties
  RetrieveReservation copyWith({
    String? professorName,
    ReservationStatus? status,
  }) {
    return RetrieveReservation(
      id: this.id,
      subjectName: this.subjectName,
      courseName: this.courseName,
      initialTime: this.initialTime,
      finalTime: this.finalTime,
      roomName: this.roomName,
      courseColor: this.courseColor,
      reservationDate: this.reservationDate,
      professorId: this.professorId,
      professorName: professorName ?? this.professorName,
      status: status ?? this.status,
    );
  }
}
