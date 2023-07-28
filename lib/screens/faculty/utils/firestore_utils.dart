import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/notification_model.dart';
import '../models/course_model.dart';
import '../models/course_professor.dart';
import '../models/floor_model.dart';
import 'package:appdevelopment/models/retrieve_reservation_model.dart';
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
    final courseProfessors =
    coursesSnapshot.docs.map((doc) => CourseProfessor.fromSnapshot(doc)).toList();

    final List<String> courseIds = [];
    for (var cp in courseProfessors) {
      if (cp.courseId.isNotEmpty) {
        courseIds.addAll(cp.courseId);
      }
    }

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

  static Future<List<Subject>> getSubjectsByCourse(String courseId, String professorId) async {
    final subjectsSnapshot = await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseId)
        .collection('subjects')
        .where('professorId', isEqualTo: professorId)
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

  static Future<List<Floor>> getFloorsByBuildings(String buildingId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('buildings/$buildingId/floors')
        .get();
    return querySnapshot.docs
        .map((doc) => Floor.fromSnapshot(doc))
        .toList();
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
  static DateTime getCurrentDate() {
    return DateTime.now();
  }
  static Future<List<RetrieveReservation>> getReservationsForProfessor(
      String professorId) async {
    try {
      final DateTime currentDate = DateTime.now();
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance
          .collection('reservations')
          .where('professorId', isEqualTo: professorId)
          .get();

      final reservations = snapshot.docs
          .map((doc) => _convertToReservation(doc))
          .where((reservation) {
        // Convert the reservationDate timestamp to DateTime
        final Timestamp reservationDateTimestamp = reservation.reservationDate;
        final DateTime reservationDate = reservationDateTimestamp.toDate();

        // Compare only the date (year, month, and day) without considering the time
        return currentDate.year == reservationDate.year &&
            currentDate.month == reservationDate.month &&
            currentDate.day == reservationDate.day;
      })
          .toList();

      return reservations;
    } catch (error) {
      // You can handle the error here or throw it to be handled elsewhere
      throw Exception('Error fetching reservations: $error');
    }
  }
  static RetrieveReservation _convertToReservation(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final id = doc.id; // Get the document ID

    return RetrieveReservation(
      id: id,
      subjectName: data['subjectName'],
      courseName: data['courseName'],
      initialTime: data['initialTime'],
      finalTime: data['finalTime'],
      roomName: data['roomName'],
      courseColor: data['courseColor'],
      reservationDate: data['reservationDate'],
      professorId: data['professorId'],
      status: data['status'],
      roomStatus: data['roomStatus'],
    );
  }


  static deleteReservation(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('reservations') // Replace with your Firestore collection name
          .doc(documentId)
          .delete();
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
  static Future<void> updateReservationTime(
      String documentId,
      DateTime newInitialTime,
      DateTime newFinalTime,
      ) async {
    try {
      await FirebaseFirestore.instance
          .collection('reservations')
          .doc(documentId)
          .update({
        'initialTime': Timestamp.fromDate(newInitialTime),
        'finalTime': Timestamp.fromDate(newFinalTime),
      });
    } catch (e) {
      print('Error updating document: $e');
    }
  }
  static Future<List<RetrieveReservation>> getAllReservationsCurrent() async {
    try {
      final DateTime currentDate = DateTime.now();
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('reservations').get();

      final reservations = snapshot.docs
          .map((doc) => _convertToReservation(doc))
          .where((reservation) {
        // Convert the reservationDate timestamp to DateTime
        final Timestamp reservationDateTimestamp = reservation.reservationDate;
        final DateTime reservationDate = reservationDateTimestamp.toDate();

        // Compare only the date (year, month, and day) without considering the time
        return currentDate.year == reservationDate.year &&
            currentDate.month == reservationDate.month &&
            currentDate.day == reservationDate.day;
      }).toList();

      return reservations;
    } catch (error) {
      // You can handle the error here or throw it to be handled elsewhere
      throw Exception('Error fetching reservations: $error');
    }
  }
  // Example method to fetch notifications for the current user
  static Future<String?> getCurrentUserId() async {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  static Future<List<NotificationData>> getFilteredNotificationsForCurrentUserAndDate() async {
    try {
      // Get the current user ID
      String? userId = await getCurrentUserId();
      if (userId == null) {
        // If user is not logged in, return an empty list
        return [];
      }

      // Get the current date
      DateTime currentDate = DateTime.now();

      // Convert currentDate to a Timestamp
      Timestamp currentTimestamp = Timestamp.fromDate(currentDate);

      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .where('notificationDate', isEqualTo: currentTimestamp)
          .get();

      final notificationDocs = snapshot.docs;
      final notifications = notificationDocs.map((doc) => NotificationData.fromSnapshot(doc)).toList();

      return notifications;
    } catch (error) {
      // You can handle the error here or throw it to be handled elsewhere
      throw Exception('Error fetching notifications: $error');
    }
  }
// Replace 'your_collection_name' with the actual name of your collection in Firestore
  Future<void>updateReservationStatus(String reservationId) async {
    try {
      final collection = FirebaseFirestore.instance.collection('reservations');
      await collection.doc(reservationId).update({'status': 'Ongoing', 'roomStatus': 'Confirmed',});
    } catch (error) {
      // Handle the error here or throw it to be handled elsewhere
      throw Exception('Error updating reservation status: $error');
    }
  }

  Future<void>updateReservationStatus2(String reservationId) async {
    try {
      final collection = FirebaseFirestore.instance.collection('reservations');
      await collection.doc(reservationId).update({'status': 'Done'});
    } catch (error) {
      // Handle the error here or throw it to be handled elsewhere
      throw Exception('Error updating reservation status: $error');
    }
  }
}
