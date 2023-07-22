import 'package:flutter/material.dart';

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

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
