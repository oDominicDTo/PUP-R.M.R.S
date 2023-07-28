import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationData {
  final String id;
  final String userId;
  final String title;
  final String message;
  final Timestamp notificationDate;

  NotificationData({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.notificationDate,
  });

  factory NotificationData.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return NotificationData(
      id: snapshot.id,
      userId: data['userId'],
      title: data['title'],
      message: data['message'],
      notificationDate: data['notificationDate'],
    );
  }
}
