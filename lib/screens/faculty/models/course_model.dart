import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String courseId;
  final String courseName;
  final DateTime initialTime;
  final DateTime finalTime;
  final Color courseColor;

  Course({
    required this.courseId,
    required this.courseName,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
  });

  factory Course.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Course(
      courseId: snapshot.id,
      courseName: data['courseName'],
      initialTime: data['initialTime'].toDate(),
      finalTime: data['finalTime'].toDate(),
      courseColor: Color(int.parse(data['courseColor'])),
    );
  }
}
