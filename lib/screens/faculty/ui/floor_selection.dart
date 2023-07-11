import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';
class FloorSelection extends StatefulWidget {
  const FloorSelection({Key? key}) : super(key: key);

  @override
  _FloorSelectionState createState() => _FloorSelectionState();
}

class _FloorSelectionState extends State<FloorSelection> {
  int index = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF0F0F0),

      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 25,
            child: Text(
              'Building A',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              // Handle container click here
              print('1st FLOOR clicked');
            },
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          '1st',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Multimedia \n \t \t Room',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle container click here
              print('2nd FLOOR clicked');
            },
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  right: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          '2nd',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\t\tRoom\n201-205',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              // Handle container click here
              print('3rd FLOOR clicked');
            },
            child: Stack(
              children: [
                Positioned(
                  bottom: 135,
                  left: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          '3rd',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\t\tRoom\n301-305',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          GestureDetector(
            onTap: () {
              // Handle container click here
              print('4th FLOOR clicked');
            },
            child: Stack(
              children: [
                Positioned(
                  bottom: 135,
                  right: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          '4th',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Comlab\n\t\t\t\t1-3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
