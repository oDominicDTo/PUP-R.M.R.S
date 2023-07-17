import 'package:cloud_firestore/cloud_firestore.dart';

class CourseProfessor {
  final String professorId;
  final String courseId;

  CourseProfessor({
    required this.professorId,
    required this.courseId,
  });

  factory CourseProfessor.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CourseProfessor(
      professorId: data['professorId'],
      courseId: data['courseId'],
    );
  }
}
