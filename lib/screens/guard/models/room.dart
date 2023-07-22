import 'package:flutter/material.dart';

class Room {
  final String roomName;
  final String subjectName;
  final String courseName;
  final String professorName;
  final String initialTime;
  final String finalTime;
  final Color courseColor;
  final DateTime date;

  Room({
    required this.roomName,
    required this.subjectName,
    required this.courseName,
    required this.professorName,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
    required this.date,
  });
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


List<Room> rooms = [
Room(
roomName: 'Room A',
  subjectName: 'Mathematics',
  courseName: 'Calculus',
  professorName: 'John Doe',
  initialTime: '5:00 AM',
  finalTime: '10:30 AM',
  courseColor: Colors.green,
  date: DateTime(2023, 7, 11),
),
  Room(
    roomName: 'Room B',
    subjectName: 'Physics',
    courseName: 'Mechanics',
    professorName: 'Jane Smith',
    initialTime: '11:00 AM',
    finalTime: '12:30 PM',
    courseColor: Colors.red,
    date: DateTime(2023, 7, 11),
  ),
  Room(
    roomName: 'Room C',
    subjectName: 'Chemistry',
    courseName: 'Organic Chemistry',
    professorName: 'Robert Johnson',
    initialTime: '2:00 PM',
    finalTime: '3:30 PM',
    courseColor: Colors.blue,
    date: DateTime(2023, 7, 17),
  ),
];
