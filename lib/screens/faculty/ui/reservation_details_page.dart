import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/retrieve_reservation_model.dart';
import 'qr_code_scanner_page.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';



class ReservationDetailsPage extends StatefulWidget {
  final RetrieveReservation reservation;

  const ReservationDetailsPage({Key? key, required this.reservation}) : super(key: key);

  @override
  State<ReservationDetailsPage> createState() => _ReservationDetailsPageState();
}

class _ReservationDetailsPageState extends State<ReservationDetailsPage> {
  bool isRoomConfirmed = false;
  String? scannedRoom;
  final FirestoreUtils _firestoreUtils = FirestoreUtils();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              Text(
                widget.reservation.roomName ?? 'N/A',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4),
              const Divider( // Add a divider below the room name
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Text(
                widget.reservation.subjectName ?? 'N/A',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.reservation.courseName ?? 'N/A',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                ' ${DateFormat('h:mm a').format(
                    widget.reservation.initialTime.toDate())} - ${DateFormat(
                    'h:mm a').format(widget.reservation.finalTime.toDate())}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              if (!isRoomConfirmed) // Show the Confirm Room button only if the room is not confirmed
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the QR code scanner page when the Confirm Room button is pressed
                    _navigateToQRCodeScannerPage();
                  },
                  child: const Text('Confirm Room'),
                ),
              if (isRoomConfirmed) // Show the Confirmed text when the room is confirmed
                const Text(
                  'Confirmed',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to navigate to the QR code scanner page
  void _navigateToQRCodeScannerPage() async {
    final result = await Navigator.push<String?>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QRCodeScannerPage(
                expectedRoom: widget.reservation.roomName, onQRScan: _onQRScan),
      ),
    );

    // Handle the scanned room result from the QR code scanner
    if (result != null) {
      scannedRoom = result;
      if (scannedRoom == widget.reservation.roomName) {
        setState(() {
          isRoomConfirmed = true;
        });
      }
    }
  }

  // Function to handle the QR code scan result
  void _onQRScan(String scannedRoom) {
    setState(() {
      this.scannedRoom = scannedRoom;
      if (this.scannedRoom == widget.reservation.roomName) {
        isRoomConfirmed = true;
        _updateReservationStatus(widget.reservation.id);

      }
    });
  }

  // Function to update the reservation status in Firestore
  Future<void> _updateReservationStatus(String reservationId) async {
    try {
      // Call the updateReservationStatus function using the instance of FirestoreUtils
      await _firestoreUtils.updateReservationStatus(reservationId);
    } catch (error) {
      // Handle the error here or throw it to be handled elsewhere
      throw Exception('Error updating reservation status: $error');
    }
  }
}

