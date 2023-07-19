import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String id;
  final String buildingId;
  final String floorId;
  final String professorId;
  final Timestamp reservationDate;
  final String roomId;
  final String subjectId;

  Reservation({
    required this.id,
    required this.buildingId,
    required this.floorId,
    required this.professorId,
    required this.reservationDate,
    required this.roomId,
    required this.subjectId,
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
    );
  }
}
