import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

class ReservationModel {
  final String id;
  final String buildingId;
  final String floorId;
  final String roomName;
  final String subject;
  final String course;
  final DateTime initialTime;
  final DateTime finalTime;
  final Color courseColor;

  ReservationModel({
    required this.id,
    required this.buildingId,
    required this.floorId,
    required this.roomName,
    required this.subject,
    required this.course,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
  });

  factory ReservationModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ReservationModel(
      id: snapshot.id,
      buildingId: data['buildingId'],
      floorId: data['floorId'],
      roomName: data['roomName'],
      subject: data['subject'],
      course: data['course'],
      initialTime: data['initialTime'].toDate(),
      finalTime: data['finalTime'].toDate(),
      courseColor: Color(int.parse(data['courseColor'])),
    );
  }

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      buildingId: json['buildingId'],
      floorId: json['floorId'],
      roomName: json['roomName'],
      subject: json['subject'],
      course: json['course'],
      initialTime: DateTime.parse(json['initialTime']),
      finalTime: DateTime.parse(json['finalTime']),
      courseColor: Color(int.parse(json['courseColor'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buildingId': buildingId,
      'floorId': floorId,
      'roomName': roomName,
      'subject': subject,
      'course': course,
      'initialTime': initialTime.toIso8601String(),
      'finalTime': finalTime.toIso8601String(),
      'courseColor': courseColor.value.toString(),
    };
  }
}
