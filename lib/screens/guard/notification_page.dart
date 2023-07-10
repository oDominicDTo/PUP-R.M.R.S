import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(
      type: NotificationType.professor,
      professorName: 'John Doe',
      roomNumber: '101',
    ),
    NotificationItem(
      type: NotificationType.verified,
      professorName: 'Jane Smith',
      roomNumber: '201',
    ),
    // Add more notifications here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Stack(
        children: [
          Positioned(
            top: 5,
            left: 30,
            child: Text(
              'Notification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          if (notifications.isNotEmpty) ...[
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
              child: ClipPath(
                clipper: CustomCardClipper(),
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 80,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage('assets/professor_image.png'), // Replace with the actual image path
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  item.type == NotificationType.professor
                                      ? Text(
                                    '${item.professorName} reserved schedule at Room ${item.roomNumber}',
                                    style: TextStyle(fontSize: 18),
                                  )
                                      : Text(
                                    '${item.professorName} reservation at Room ${item.roomNumber} ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  if (item.type == NotificationType.verified)
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: Colors.green),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Verified',
                                          style: TextStyle(fontSize: 14, color: Colors.green),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class NotificationItem {
  final NotificationType type;
  final String professorName;
  final String roomNumber;

  NotificationItem({
    required this.type,
    required this.professorName,
    required this.roomNumber,
  });
}

enum NotificationType {
  professor,
  verified,
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 16);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
