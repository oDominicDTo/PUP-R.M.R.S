import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String buildingId;
  final String floorId;
  final String courseId;
  final String roomId;

  Reservation({
    required this.buildingId,
    required this.floorId,
    required this.courseId,
    required this.roomId,
  });

  Map<String, dynamic> toMap() {
    return {
      'buildingId': buildingId,
      'floorId': floorId,
      'courseId': courseId,
      'roomId': roomId,
    };
  }

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      buildingId: data['buildingId'],
      floorId: data['floorId'],
      courseId: data['courseId'],
      roomId: data['roomId'],
    );
  }
}
