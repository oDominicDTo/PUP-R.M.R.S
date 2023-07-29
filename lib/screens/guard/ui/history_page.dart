import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/guard/utils/guard_firestore_utils.dart';
import 'package:appdevelopment/screens/guard/utils/guard_color_utils.dart';
import '../../../models/retrieve_reservation_model.dart';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<RetrieveReservation> rooms = [];
  List<RetrieveReservation> filteredRooms = [];
  String searchQuery = '';
  DateTime selectedDate = DateTime.now();
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<void> _handleRefresh() async {
    try {
      final List<RetrieveReservation> allReservations =
          await FireStoreUtilsForGuard.getAllReservationsForGuard();

      // Update the rooms list with professor names
      final updatedReservations = await fetchProfessorNames(allReservations);

      setState(() {
        rooms = updatedReservations;
        filterRooms();
      });
    } catch (error) {
      print('Error fetching reservations: $error');
    }
  }

  Future<List<RetrieveReservation>> fetchProfessorNames(
      List<RetrieveReservation> reservations) async {
    final updatedReservations = <RetrieveReservation>[];

    for (final reservation in reservations) {
      final professorDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(reservation.professorId)
          .get();
      if (professorDoc.exists) {
        final professorData = professorDoc.data() as Map<String, dynamic>;
        final professorName =
            professorData['displayName'] as String? ?? 'Unknown';
        final updatedReservation =
            reservation.copyWith(professorName: professorName);
        updatedReservations.add(updatedReservation);
      } else {
        updatedReservations.add(reservation);
      }
    }

    return updatedReservations;
  }

  void filterRooms() {
    filteredRooms = rooms.where((room) {
      final reservationDate = room.reservationDate.toDate();

      return reservationDate.year == selectedDate.year &&
          reservationDate.month == selectedDate.month &&
          reservationDate.day == selectedDate.day;
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        filterRooms();
      });
    }
  }

  Future<void> requestPermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission is granted. Export the file.
      _exportDataToCsv();
    } else {
      // Permission is denied. Show a dialog or message to the user.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Permission Denied'),
          content: Text('Please grant storage permission to export the file.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _exportDataToCsv() async {
    try {
      List<List<dynamic>> csvData = [
        // Add CSV header row
        [
          'Room Name',
          'Subject Name',
          'Professor Name',
          'Course Name',
          'Start Time',
          'End Time'
        ],
        // Add data rows
        ...filteredRooms.map((room) => [
              room.roomName ?? 'N/A',
              room.subjectName ?? 'N/A',
              room.professorName,
              room.courseName ?? 'N/A',
              DateFormat('h:mm a').format(room.initialTime.toDate()),
              DateFormat('h:mm a').format(room.finalTime.toDate()),
            ]),
      ];

      // Get the CSV string
      String csvString = const ListToCsvConverter().convert(csvData);

      // Save the CSV string to a file only if permission is granted
      final status = await Permission.storage.status;
      if (status.isGranted) {
        // Get the CSV string
        String csvString = const ListToCsvConverter().convert(csvData);

        // Save the CSV string to a file
        final String csvFileName = "reservations.csv";
        final directory = await getApplicationDocumentsDirectory();
        final file = File("${directory!.path}/$csvFileName");
        await file.writeAsString(csvString);

        // Show a message indicating the export was successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data exported to $csvFileName")),
        );
        print('file exported');
      } else {
        // Permission is denied. Show a dialog or message to the user.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Permission Denied'),
            content:
                Text('Please grant storage permission to export the file.\n'
                    'To grant the permission, go to your device settings, '
                    'find the app, and enable the "Storage" permission.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print('Error exporting data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error exporting data")),
      );
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
            right: 10,
            child: Container(
              height: 30, // Set the desired height
              width: double.infinity,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: const Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "< Calendar",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFC5C5C5),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        requestPermission(); // Call the requestPermission function
                      },
                      child: Icon(
                        Icons.drive_folder_upload_outlined,
                        size: 30,
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
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _handleRefresh,
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

                    // Convert reservation initialTime and finalTime timestamps to DateTime
                    DateTime initialDateTime = room.initialTime.toDate();
                    DateTime finalDateTime = room.finalTime.toDate();

                    // Format initialTime and finalTime as desired (e.g., 'h:mm a')
                    String formattedInitialTime =
                        DateFormat('h:mm a').format(initialDateTime);
                    String formattedFinalTime =
                        DateFormat('h:mm a').format(finalDateTime);

                    String? courseColorString = room.courseColor;
                    Color? courseColor =
                        ColorUtils.stringToColor(courseColorString);

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: courseColor ?? Colors.transparent,
                              width: 10,
                            ),
                          ),
                        ),
                        // Inside the ListView.builder
                        // Inside the ListView.builder
                        child: ListTile(
                          onTap: () {
                            // Handle tile tap action
                          },
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(
                            '${room.roomName ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${room.subjectName ?? 'N/A'}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${room.professorName}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          trailing: Container(
                            width: MediaQuery.of(context).size.width *
                                0.33, // 25% of screen width
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      '${room.courseName ?? 'N/A'}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: courseColor,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '$formattedInitialTime - $formattedFinalTime',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          dense: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
