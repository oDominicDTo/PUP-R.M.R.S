import 'package:cloud_firestore/cloud_firestore.dart';



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
  String status; // Add the status property
  String roomStatus;
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
    required this.status, // Set the default status to 'upcoming'
    required this.roomStatus,
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
      status: data['status'],
      roomStatus: data['roomStatus'],
    );
  }

  // Add the copyWith method to update the professorName and status properties
  RetrieveReservation copyWith({
    String? professorName,
  }) {
    return RetrieveReservation(
      id: id,
      subjectName: subjectName,
      courseName: courseName,
      initialTime: initialTime,
      finalTime: finalTime,
      roomName: roomName,
      courseColor: courseColor,
      reservationDate: reservationDate,
      professorId: professorId,
      professorName: professorName ?? this.professorName,
      status: status,
      roomStatus: roomStatus,
    );
  }
}
