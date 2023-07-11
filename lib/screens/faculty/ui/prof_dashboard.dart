import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:intl/intl.dart';
class ProfHomeDB extends StatefulWidget {
  const ProfHomeDB({Key? key}) : super(key: key);

  @override
  _ProfHomeDBState createState() => _ProfHomeDBState();
}

class _ProfHomeDBState extends State<ProfHomeDB> {
  int index = 0;



  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 10,
            left: 35,
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Positioned(
            top: 45,
            left: 20,
            child: Column(
              children: [
                Text(
                  'Your Schedule',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 65,
            left: 20,
            child: Text(
              'Today: $currentDate',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
     );
  }
}
