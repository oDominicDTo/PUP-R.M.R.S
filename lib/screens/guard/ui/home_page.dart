import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/guard/utils/guard_firestore_utils.dart';
import 'package:appdevelopment/screens/guard/utils/guard_color_utils.dart';
import '../../../models/retrieve_reservation_model.dart';

class GuardHomePage extends StatefulWidget {
  const GuardHomePage({Key? key}) : super(key: key);

  @override
  State<GuardHomePage> createState() => _GuardHomePageState();
}

class _GuardHomePageState extends State<GuardHomePage> {
  List<RetrieveReservation> rooms = [];
  List<RetrieveReservation> filteredRooms = [];
  String searchQuery = '';
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchReservations(); // Call the function to fetch reservations from Firestore
  }

  Future<void> _handleRefresh() async {
    try {
      // Fetch new data or update the current data here
      final List<RetrieveReservation> allReservations =
          await FireStoreUtilsForGuard.getAllReservationsCurrentForGuard();

      // Update the rooms list with professor names
      final updatedReservations = await fetchProfessorNames(allReservations);

      setState(() {
        rooms = updatedReservations;
        filterRooms();
      });
    } catch (error) {
      // Handle any errors that occurred during the data retrieval process
      print('Error fetching reservations: $error');
    }
  }

  void fetchReservations() async {
    try {
      final List<RetrieveReservation> allReservations =
          await FireStoreUtilsForGuard.getAllReservationsCurrentForGuard();

      // Update the rooms list with professor names
      final updatedReservations = await fetchProfessorNames(allReservations);

      setState(() {
        rooms = updatedReservations;
        filterRooms();
      });
    } catch (error) {
      // Handle any errors that occurred during the data retrieval process
      print('Error fetching reservations: $error');
    }
  }

  Future<List<RetrieveReservation>> fetchProfessorNames(
      List<RetrieveReservation> reservations) async {
    final updatedReservations = <RetrieveReservation>[];

    for (final reservation in reservations) {
      // Fetch the professor document directly using the professorId
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
        // Professor document does not exist or not accessible, handle it if needed
        // Add the reservation as is without the professor name
        updatedReservations.add(reservation);
      }
    }

    return updatedReservations;
  }

  void filterRooms() {

    filteredRooms = rooms.where((room) {
      final roomName = room.roomName?.toLowerCase() ?? '';
      final subjectName = room.subjectName?.toLowerCase() ?? '';
      final course = room.courseName?.toLowerCase() ?? '';
      final professorName = room
          .professorName; // Replace 'professorName' with 'professorId' if needed
      final searchLowerCase = searchQuery.toLowerCase();

      return roomName.contains(searchLowerCase) ||
          subjectName.contains(searchLowerCase) ||
          course.contains(searchLowerCase) ||
          professorName.contains(searchLowerCase);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    return Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        body: Stack(alignment: Alignment.center, children: [
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
              ))
        ]));
  }
}
