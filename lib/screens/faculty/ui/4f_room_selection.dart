import 'package:flutter/material.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';

class FourFRoomSelect extends StatefulWidget {
  const FourFRoomSelect({Key? key}) : super(key: key);

  @override
  State<FourFRoomSelect> createState() => _FourFRoomSelectState();
}

class _FourFRoomSelectState extends State<FourFRoomSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: Color(0xFFF0F0F0),
      body: Stack(
        children: [
          // Background box with text
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              height: 170,
              decoration: BoxDecoration(
                color: Color(0xFF5B0101),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Building A\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26, // Adjust the font size for "Building A"
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "4th Floor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Front boxes
          Positioned(
            top: 120,
            left: 25, // Add left padding to the front box
            right: 25, // Add right padding to the front box
            bottom: 170,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add Padding above the "Available Rooms" text
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.center, // Center the text horizontally
                      child: Text(
                        "Available Rooms",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Adding spacing between title and room boxes
                  Expanded(
                    child: Align(
                      alignment: Alignment.center, // Center the room boxes horizontally
                      child: Column(
                        children: [
                          RoomBox("Com Lab 401", () {
                            // Handle onTap for Room 201
                            print("Com Lab 401 tapped");
                          }),
                          RoomBox("Com Lab 402", () {
                            // Handle onTap for Room 202
                            print("ComLab 402 tapped");
                          }),
                          RoomBox("Com Lab 403", () {
                            // Handle onTap for Room 203
                            print("Com Lab 403 tapped");
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomBox extends StatelessWidget {
  final String roomNumber;
  final VoidCallback onTap;

  RoomBox(this.roomNumber, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign the onTap callback to the GestureDetector
      child: Container(
        width: 255,
        height: 50,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black, // Border color
            width: 2.0, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            roomNumber,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}