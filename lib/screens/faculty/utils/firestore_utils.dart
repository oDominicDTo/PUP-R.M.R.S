import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import '../models/course_model.dart';
import '../models/course_professor.dart';
import '../models/floor_model.dart';

import '../models/reservation_model.dart';
import '../models/subject_model.dart';
class FirestoreUtils {
  static Future<List<Floor>> getFloorsByBuilding(String buildingId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors')
        .get();
    return querySnapshot.docs
        .map((doc) => Floor.fromSnapshot(doc))
        .toList();
  }



  static Future<List<Course>> getCoursesByProfessor(String professorId) async {
    final coursesQuery = FirebaseFirestore.instance
        .collection('courseProfessors')
        .where('professorId', isEqualTo: professorId)
        .get();

    final coursesSnapshot = await coursesQuery;
    final courseProfessors = coursesSnapshot.docs.map((doc) => CourseProfessor.fromSnapshot(doc)).toList();

    final courseIds = courseProfessors.map((cp) => cp.courseId).toList();

    final courseDetailsQuery = FirebaseFirestore.instance
        .collection('courses')
        .where(FieldPath.documentId, whereIn: courseIds)
        .get();

    final courseDetailsSnapshot = await courseDetailsQuery;
    final courses = courseDetailsSnapshot.docs.map((doc) => Course.fromSnapshot(doc)).toList();

    return courses;
  }

  static Future<Subject> getSubjectByCourseAndSubjectId(String courseId, String subjectId) async {
    final subjectDoc = await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseId)
        .collection('subjects')
        .doc(subjectId)
        .get();

    if (subjectDoc.exists) {
      final data = subjectDoc.data() as Map<String, dynamic>;
      final subjectName = data['subjectName'] as String;
      final professorId = data['professorId'] as String;
      final initialTime = (data['initialTime'] as Timestamp).toDate();
      final finalTime = (data['finalTime'] as Timestamp).toDate();

      return Subject(
        subjectId: subjectId,
        subjectName: subjectName,
        professorId: professorId,
        initialTime: initialTime,
        finalTime: finalTime,
      );
    } else {
      throw Exception('Subject not found');
    }
  }

  static Future<List<Subject>> getSubjectsByCourse(String courseId) async {
    final subjectsSnapshot = await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseId)
        .collection('subjects')
        .get();

    return subjectsSnapshot.docs.map((doc) {
      final data = doc.data();
      final subjectId = doc.id;
      final subjectName = data['subjectName'] as String;
      final professorId = data['professorId'] as String;
      final initialTime = (data['initialTime'] as Timestamp).toDate();
      final finalTime = (data['finalTime'] as Timestamp).toDate();

      return Subject(
        subjectId: subjectId,
        subjectName: subjectName,
        professorId: professorId,
        initialTime: initialTime,
        finalTime: finalTime,
      );
    }).toList();
  }

  static Future<List<Room>> getAvailableRooms(
      String buildingId, String floorId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors/$floorId/rooms')
        .where('available', isEqualTo: true)
        .get();

    return querySnapshot.docs.map((doc) => Room.fromSnapshot(doc)).toList();
  }

  static Future<List<Floor>> getFloorsByBuildings(String buildingId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors')
        .get();
    return querySnapshot.docs
        .map((doc) => Floor.fromSnapshot(doc))
        .toList();
  }


  static Future<List<Reservation>> getReservationsByProfessorId(String professorId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('reservations')
        .where('professorId', isEqualTo: professorId)
        .get();

    return querySnapshot.docs.map((doc) => Reservation.fromSnapshot(doc)).toList();
  }
  static Future<Course> getCourseById(String courseId) async {
    final courseDoc = await FirebaseFirestore.instance.collection('courses').doc(courseId).get();

    if (courseDoc.exists) {
      final data = courseDoc.data() as Map<String, dynamic>;
      final courseName = data['courseName'] as String;
      final courseColor = data['courseColor'] as String;

      return Course(
        courseId: courseId,
        courseName: courseName,
        courseColor: courseColor,
      );
    } else {
      throw Exception('Course not found');
    }
  }
}
