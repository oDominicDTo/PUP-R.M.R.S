import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(BuildContext context, String title, String message, VoidCallback onConfirm) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm(); // Call the callback function passed as a parameter
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}
