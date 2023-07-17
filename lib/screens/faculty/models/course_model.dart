import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String courseId;
  final String courseName;
  final String courseColor;

  Course({
    required this.courseId,
    required this.courseName,
    required this.courseColor,
  });

  factory Course.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Course(
      courseId: snapshot.id,
      courseName: data['courseName'],
      courseColor: data['courseColor'],
    );
  }
}
