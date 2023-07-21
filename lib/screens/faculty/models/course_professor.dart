import 'package:cloud_firestore/cloud_firestore.dart';

class CourseProfessor {
  final String professorId;
  final List<String> courseId;

  CourseProfessor({
    required this.professorId,
    required this.courseId,
  });

  factory CourseProfessor.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final List<String>? courseId = data['courseId'] != null ? List<String>.from(data['courseId']) : [];
    return CourseProfessor(
      professorId: data['professorId'],
      courseId: courseId ?? [], // Initialize with an empty list if courseIds is null
    );
  }
}
