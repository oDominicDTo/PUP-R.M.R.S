import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GuardHomePage extends StatefulWidget {
  const GuardHomePage({Key? key}) : super(key: key);

  @override
  State<GuardHomePage> createState() => _GuardHomePageState();
}

class _GuardHomePageState extends State<GuardHomePage> {
   List<Room> rooms = [
    Room(
      roomName: 'Room A',
      subjectName: 'Mathematics',
      course: 'Calculus',
      professorName: 'John Doe',
      initialTime: '9:00 AM',
      finalTime: '10:30 AM',
      courseColor: Colors.green,
    ),
    Room(
      roomName: 'Room dB',
      subjectName: 'Physics',
      course: 'Mechanics',
      professorName: 'Jane Smith',
      initialTime: '11:00 AM',
      finalTime: '12:30 PM',
      courseColor: Colors.red,
    ),
    Room(
      roomName: 'Room sdsdsA',
      subjectName: 'Mathematics',
      course: 'Calculus',
      professorName: 'John Doe',
      initialTime: '9:00 AM',
      finalTime: '10:30 AM',
      courseColor: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 120,
            left: 10,
            child: Container(
              width: 372.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  currentDate,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 5,
            left: 30,
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFFC5C5C5).withOpacity(0.2),
                        fontFamily: 'Poppins',
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Name, Subject, Course',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle icon tap action
                      },
                      child: Image.asset(
                        'assets/searchicon.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 10,
            bottom: -1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return Card(
                   // Set your desired card color here
                    elevation: 4, // Adjust the elevation value for the shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set your desired border radius
                    ),
                    child: ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Set the same color as the card color
                          border: Border(
                            bottom: BorderSide(color: room.courseColor ?? Colors.transparent, width: 10),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 200,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Room: ${room.roomName}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text('Subject: ${room.subjectName}'),
                                Text('Course: ${room.course}'),
                                Text('Professor: ${room.professorName}'),
                                Text('Time: ${room.initialTime} - ${room.finalTime}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Room {
  final String roomName;
  final String subjectName;
  final String course;
  final String professorName;
  final String initialTime;
  final String finalTime;
  final Color courseColor;

  Room({
    required this.roomName,
    required this.subjectName,
    required this.course,
    required this.professorName,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
  });
}
