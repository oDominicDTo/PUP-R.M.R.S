import 'package:flutter/material.dart';
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

      backgroundColor: const Color(0xFFF0F0F0),

      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          '1st',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        const Text(
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
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: const Column(
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          '2nd',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        const Text(
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
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: const Column(
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          '3rd',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        const Text(
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
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: const Column(
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF5B0101),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          '4th',
                          style: TextStyle(
                            color: Color(0xF0F0F0F0),
                            fontSize: 45,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        const Text(
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
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: const Column(
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
