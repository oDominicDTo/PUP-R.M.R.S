import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late DateTime selectedDate;

  List<Room> rooms = [
    Room(
      roomName: 'Room A',
      subjectName: 'Mathematics',
      course: 'Calculus',
      professorName: 'John Doe',
      initialTime: '5:00 AM',
      finalTime: '10:30 AM',
      courseColor: Colors.green,
      date: DateTime(2023, 7, 16),
    ),
    Room(
      roomName: 'Room B',
      subjectName: 'Physics',
      course: 'Mechanics',
      professorName: 'Jane Smith',
      initialTime: '11:00 AM',
      finalTime: '12:30 PM',
      courseColor: Colors.red,
      date: DateTime(2023, 7, 16),
    ),
    Room(
      roomName: 'Room C',
      subjectName: 'Chemistry',
      course: 'Organic Chemistry',
      professorName: 'Robert Johnson',
      initialTime: '2:00 PM',
      finalTime: '3:30 PM',
      courseColor: Colors.blue,
      date: DateTime(2023, 7, 17),
    ),
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(selectedDate);

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
    'History',
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
    child: GestureDetector(
    onTap: () => _selectDate(context),
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    height: 48,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
    children: [
    Icon(Icons.calendar_today_outlined),
    const SizedBox(width: 10),
    Text(
    DateFormat('MMMM dd, yyyy').format(selectedDate),
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
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
    if (room.date.year == selectedDate.year &&
    room.date.month == selectedDate.month &&
    room.date.day == selectedDate.day) {
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
          ));
    } else {
      return Container(); // Return an empty container for dates without any rooms
    }
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

