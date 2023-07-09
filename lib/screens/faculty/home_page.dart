import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FacultyHomePage extends StatelessWidget {
  const FacultyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 120,
            left: 10,
            child: Container(
              width: 372.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(

                  currentDate,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'
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
                      style: TextStyle(fontSize: 13, color: const Color(0xFFC5C5C5).withOpacity(0.2),fontFamily: 'Poppins',),
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: ListView.builder(
                itemCount: 10, // Replace with the actual item count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      height: 90, // Adjust the height of each rectangular object
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
