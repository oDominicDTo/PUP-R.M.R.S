import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevelopment/screens/faculty/models/room_model.dart';
import '../models/course_model.dart';
import '../models/floor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUtils {
  static Future<List<Floor>> getFloorsByBuilding(String buildingId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors')
        .get();
    return querySnapshot.docs
        .map((doc) => Floor.fromSnapshot(doc))
        .toList();
  }

  static Future<List<Course>> getCourses() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('courseProfessors')
        .where('professorId', isEqualTo: currentUser?.uid)
        .get();

    final courseIds = querySnapshot.docs.map((doc) => doc['courseId']).toList();

    final snapshot = await FirebaseFirestore.instance
        .collection('courses')
        .where(FieldPath.documentId, whereIn: courseIds)
        .get();

    return snapshot.docs.map((doc) => Course.fromSnapshot(doc)).toList();
  }


  static Future<List<Room>> getAvailableRooms(
      String buildingId, String floorId, String courseId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors/$floorId/rooms')
        .where('courseId', isEqualTo: courseId)
        .get();
    return querySnapshot.docs.map((doc) => Room.fromSnapshot(doc)).toList();
  }
}
