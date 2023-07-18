import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

class Reservation {
  final String id;
  final String roomName;
  final String subject;
  final String course;
  final DateTime initialTime;
  final DateTime finalTime;
  final Color courseColor;

  Reservation({
    required this.id,
    required this.roomName,
    required this.subject,
    required this.course,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
  });

  factory Reservation.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Reservation(
      id: snapshot.id,
      roomName: data['roomName'],
      subject: data['subject'],
      course: data['course'],
      initialTime: data['initialTime'].toDate(),
      finalTime: data['finalTime'].toDate(),
      courseColor: Color(int.parse(data['courseColor'])),
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
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
      'roomName': roomName,
      'subject': subject,
      'course': course,
      'initialTime': initialTime.toIso8601String(),
      'finalTime': finalTime.toIso8601String(),
      'courseColor': courseColor.value.toString(),
    };
  }
}
