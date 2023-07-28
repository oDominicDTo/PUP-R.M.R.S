import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/models/notification_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationData> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications(); // Fetch filtered notifications for the current user and current date
  }

  Future<void> fetchNotifications() async {
    try {
      List<NotificationData> filteredNotifications =
      await FirestoreUtils.getFilteredNotificationsForCurrentUserAndDate();

      setState(() {
        notifications = filteredNotifications;
      });
    } catch (error) {
      // Handle error if needed
      print('Error fetching notifications: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
        backgroundColor: const Color(0xF0F0F0F0),
      body: notifications.isEmpty
          ? Center(
        child: Text('No notifications for today.'),
      )
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 2,
              child: ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.message),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle notification tap here
                  // For example, show a pop-up dialog with notification details
                  _showNotificationDetailsDialog(context, notification);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showNotificationDetailsDialog(BuildContext context, NotificationData notification) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(notification.title),
          content: Text(notification.message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
