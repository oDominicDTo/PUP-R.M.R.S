/*
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/controller/reservation_controller.dart';
import 'package:appdevelopment/screens/faculty/models/reservation_model.dart';

class AddReservationPage extends StatefulWidget {
  const AddReservationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddReservationPageState();
}

class _AddReservationPageState extends State<AddReservationPage> {
  final ReservationController _reservationController = ReservationController();

  String selectedBuilding = '';
  String selectedFloor = '';
  String selectedCourse = '';
  String selectedSubject = '';
  String selectedRoom = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reservation'),
      ),
      body: Column(
        children: [
          // Building Selection
          DropdownButtonFormField<String>(
            value: selectedBuilding,
            items: const [
              DropdownMenuItem<String>(
                value: 'buildinga',
                child: Text('Building A'),
              ),
              DropdownMenuItem<String>(
                value: 'buildingb',
                child: Text('Building B'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedBuilding = value!;
              });
            },
          ),
          // Floor Selection
          DropdownButtonFormField<String>(
            value: selectedFloor,
            items: const [
              DropdownMenuItem<String>(
                value: 'floor1',
                child: Text('Floor 1'),
              ),
              DropdownMenuItem<String>(
                value: 'floor2',
                child: Text('Floor 2'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedFloor = value!;
              });
            },
          ),
          // Course Selection
          DropdownButtonFormField<String>(
            value: selectedCourse,
            items: const [
              DropdownMenuItem<String>(
                value: 'course1',
                child: Text('Course 1'),
              ),
              DropdownMenuItem<String>(
                value: 'course2',
                child: Text('Course 2'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedCourse = value!;
              });
            },
          ),
          // Subject Selection
          DropdownButtonFormField<String>(
            value: selectedSubject,
            items: const [
              DropdownMenuItem<String>(
                value: 'subject1',
                child: Text('Subject 1'),
              ),
              DropdownMenuItem<String>(
                value: 'subject2',
                child: Text('Subject 2'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedSubject = value!;
              });
            },
          ),
          // Room Selection
          DropdownButtonFormField<String>(
            value: selectedRoom,
            items: const [
              DropdownMenuItem<String>(
                value: 'room1',
                child: Text('Room 1'),
              ),
              DropdownMenuItem<String>(
                value: 'room2',
                child: Text('Room 2'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedRoom = value!;
              });
            },
          ),
          // Add Reservation Button
          ElevatedButton(
            onPressed: () {
              if (selectedBuilding.isNotEmpty &&
                  selectedFloor.isNotEmpty &&
                  selectedCourse.isNotEmpty &&
                  selectedSubject.isNotEmpty &&
                  selectedRoom.isNotEmpty) {
                Reservation reservation = Reservation(
                  buildingId: selectedBuilding,
                  floorId: selectedFloor,
                  courseId: selectedCourse,
                  subjectId: selectedSubject,
                  roomId: selectedRoom,
                );
                _reservationController.addReservation(reservation);
                Navigator.pop(context);
              } else {
                // Handle validation or show error message
              }
            },
            child: const Text('Add Reservation'),
          ),
        ],
      ),
    );
  }
}
*/
