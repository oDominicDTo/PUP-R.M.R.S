import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/retrieve_reservation_model.dart';
import '../utils/firestore_utils.dart';

class ModifyDialog extends StatefulWidget {
  final RetrieveReservation reservation;
  final Function(RetrieveReservation) onSave;

  const ModifyDialog({super.key, required this.reservation, required this.onSave});

  @override
  State<ModifyDialog> createState() => _ModifyDialogState();
}

class _ModifyDialogState extends State<ModifyDialog> {
  late DateTime initialDateTime;
  late DateTime finalDateTime;

  @override
  void initState() {
    super.initState();
    initialDateTime = widget.reservation.initialTime.toDate();
    finalDateTime = widget.reservation.finalTime.toDate();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text('Modify Reservation Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTimePicker(initialDateTime, (newTime) {
                setState(() {
                  initialDateTime = newTime;
                });
              }),
              buildTimePicker(finalDateTime, (newTime) {
                setState(() {
                  finalDateTime = newTime;
                });
              }),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                widget.onSave(widget.reservation);

                Navigator.of(context).pop();

                await FirestoreUtils.updateReservationTime(
                  widget.reservation.id,
                  initialDateTime,
                  finalDateTime,
                );

                // Update the local reservation list with the modified values
                widget.reservation.initialTime = Timestamp.fromDate(initialDateTime);
                widget.reservation.finalTime = Timestamp.fromDate(finalDateTime);



              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget buildTimePicker(DateTime initialTime, Function(DateTime) onChanged) {
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(initialTime);

    return InkWell(
      onTap: () async {
        TimeOfDay? newTimeOfDay = await showTimePicker(
          context: context,
          initialTime: timeOfDay,
        );

        if (newTimeOfDay != null) {
          DateTime newTime = DateTime(
            initialTime.year,
            initialTime.month,
            initialTime.day,
            newTimeOfDay.hour,
            newTimeOfDay.minute,
          );
          onChanged(newTime);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          DateFormat('h:mm a').format(initialTime),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}