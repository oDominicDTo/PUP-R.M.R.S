import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/retrieve_reservation_model.dart';

class GuardDetailsPage extends StatefulWidget {
  final RetrieveReservation room;

  const GuardDetailsPage({Key? key, required this.room})
      : super(key: key);

  @override
  State<GuardDetailsPage> createState() => _ReservationDetailsPageState();
}

class _ReservationDetailsPageState extends State<GuardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF5B0101),
        // Set the background color to dark red
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: const Color(0xFF5B0101),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
            child: Container(
                width: 360,
                height: 380,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 50),
                  Text(
                    widget.room.roomName ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Divider(
                    // Add a divider below the room name
                    color: Colors.black,
                    thickness: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.room.subjectName ?? 'N/A',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.room.courseName ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    ' ${DateFormat('h:mm a').format(widget.room.initialTime.toDate())} - ${DateFormat('h:mm a').format(widget.room.finalTime.toDate())}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.room.roomStatus,
                    style:  TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: widget.room.roomStatus == 'Pending' ? Colors.grey : Colors.green,
                    ),
                  )
                ]))));
  }
}
