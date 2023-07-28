import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QRCodeScannerPage extends StatefulWidget {
  final String? expectedRoom;
  final void Function(String) onQRScan;

  const QRCodeScannerPage({super.key,
    required this.expectedRoom,
    required this.onQRScan,
  });

  @override
  State createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanned = false;


  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          if (!scanned) // Show the confirm button only if the QR code is not scanned yet
            ElevatedButton(
              onPressed: () {
                // Handle the case when the QR code is not scanned yet
                // For example, show a snackbar or an alert dialog
                _showAlert('QR Code Not Scanned', 'Please scan the QR code first.');
              },
              child: const Text('Scan QR'),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        setState(() {
          scanned = true;
        });

        // Handle the scanned data here
        String? scannedRoom = scanData.code;

        if (scannedRoom == widget.expectedRoom) {

          widget.onQRScan(scannedRoom!); // Notify the parent page with the scanned room
          Navigator.pop(context);
        } else {
          // Show an alert when the room names do not match
          _showAlert('Room Mismatch', 'Scanned room does not match the expected room.');
        }

        // You can choose to close the scanner page after a successful scan
        // Navigator.pop(context, scannedRoom);
      }
    });
  }

  void _showAlert(String title, String message) {
    Alert(
      context: context,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.blue,
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
