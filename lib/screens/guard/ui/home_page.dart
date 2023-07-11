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
      date: DateTime.now(),
    ),
    Room(
      roomName: 'Room dB',
      subjectName: 'Physics',
      course: 'Mechanics',
      professorName: 'Jane Smith',
      initialTime: '11:00 AM',
      finalTime: '12:30 PM',
      courseColor: Colors.red,
      date: DateTime.now(),
    ),
    Room(
      roomName: 'Room sdsdsA',
      subjectName: 'Mathematics',
      course: 'Calculus',
      professorName: 'John Doe',
      initialTime: '9:00 AM',
      finalTime: '10:30 AM',
      courseColor: Colors.yellow,
      date: DateTime.now(),
    ),
  ];

  List<Room> filteredRooms = []; // Filtered list of rooms
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filterRooms();
  }

  void filterRooms() {
    final currentDate = DateTime.now();

    filteredRooms = rooms.where((room) {
      final roomName = room.roomName.toLowerCase();
      final subjectName = room.subjectName.toLowerCase();
      final course = room.course.toLowerCase();
      final professorName = room.professorName.toLowerCase();
      final searchLowerCase = searchQuery.toLowerCase();

      return roomName.contains(searchLowerCase) ||
          subjectName.contains(searchLowerCase) ||
          course.contains(searchLowerCase) ||
          professorName.contains(searchLowerCase);
    }).where((room) =>
    room.date.year == currentDate.year &&
        room.date.month == currentDate.month &&
        room.date.day == currentDate.day).toList();
  }

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
    style: const TextStyle(
    fontSize: 13,
    color: Color(0xFFC5C5C5),
    fontFamily: 'Poppins',
    ),
    onChanged: (value) {
    setState(() {
    searchQuery = value;
    filterRooms();
    });
    },
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
    itemCount: filteredRooms.length,
    itemBuilder: (context, index) {
    final room = filteredRooms[index];
    return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    child: ClipPath(
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border(
    bottom: BorderSide(
    color: room.courseColor,
    width: 10,
    ),
    ),
    ),
    child: Container(
    padding: const EdgeInsets.all(16),
    height: 110,
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    flex: 1,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    '${room.roomName}',
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    ),
    ),
    const SizedBox(height: 10),
    Text(
    '   ${room.subjectName}',
    style: const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    ),
    ),
    Text(
    '   ${room.professorName}',
    style: const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    ),
    ),
    ],
    ),
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text(
    '${room.course}',
    style: TextStyle(
    fontSize: 15,
    color: room.courseColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 35),
    Stack(
    children: [
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    height: 20,
    width: 150,
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
    child: Text(
    '    ${room.initialTime} - ${room.finalTime}',
    style: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    ),
    ),
    ),
    ),
    const Positioned(
    left: 6,
      top: 2,
      bottom: 10,
      child: Icon(
        Icons.access_time,
        color: Colors.white,
        size: 15,
      ),
    ),
    ],
    ),
    ],
    ),
    ],
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
  final DateTime date;

  Room({
    required this.roomName,
    required this.subjectName,
    required this.course,
    required this.professorName,
    required this.initialTime,
    required this.finalTime,
    required this.courseColor,
    required this.date,
  });
}



/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/guard/logic/guard_home_page_logic.dart';

class GuardHomePage extends StatefulWidget {
  const GuardHomePage({Key? key}) : super(key: key);

  @override
  State<GuardHomePage> createState() => _GuardHomePageState();
}

class _GuardHomePageState extends State<GuardHomePage> {
  final GuardHomePageLogic logic = GuardHomePageLogic();

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
                      onChanged: (value) {
                        logic.updateSearchQuery(value);
                      },
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
                itemCount: logic.filteredRooms.length,
                itemBuilder: (context, index) {
                  final room = logic.filteredRooms[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: room.courseColor,
                              width: 10,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 110,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${room.roomName}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '   ${room.subjectName}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '   ${room.professorName}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${room.course}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: room.courseColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                        height: 20,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '    ${room.initialTime} - ${room.finalTime}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 6,
                                        top: 2,
                                        bottom: 10,
                                        child: Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
*/
