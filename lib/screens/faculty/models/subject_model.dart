import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  final String subjectId;
  final String subjectName;
  final String professorId;
  final DateTime initialTime;
  final DateTime finalTime;

  Subject({
    required this.subjectId,
    required this.subjectName,
    required this.professorId,
    required this.initialTime,
    required this.finalTime,
  });

  factory Subject.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Subject(
      subjectId: snapshot.id,
      subjectName: data['subjectName'],
      professorId: data['professorId'],
      initialTime: (data['initialTime'] as Timestamp).toDate(),
      finalTime: (data['finalTime'] as Timestamp).toDate(),
    );
  }
}
