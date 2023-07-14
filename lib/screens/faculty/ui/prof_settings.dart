import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';

class ProfSettings extends StatelessWidget {
  const ProfSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 174,
              decoration: BoxDecoration(
                color: kDarkRed,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 70,
            left: 30,
            child: CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage('assets/professor_image.png'),
            ),
          ),
          const Positioned(
            top: 90,
            left: 120,
            child: Text(
              'User name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 5,
            left: 30,
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perform action for button 1
                    },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Change Profile Picture',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Perform action for button 2
                    },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.pending_actions, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Terms & Condition',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Perform action for button 3
                    },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.policy, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      AuthenticationRepository.instance.logout();
                    },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Log out',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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



/*
Positioned.fill(
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
GestureDetector(
onTap: () {
// Perform action for button 1
},
child: Container(
width: 372, // Adjust the width as needed
height: 50, // Adjust the height as needed
decoration: BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.circular(8),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.5),
blurRadius: 5,
offset: const Offset(0, 2),
),
],
),
child: Center(
child: Text(
'Button 1',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
),
),
SizedBox(height: 15),
GestureDetector(
onTap: () {
// Perform action for button 2
},
child: Container(
width: 372, // Adjust the width as needed
height: 50, // Adjust the height as needed
decoration: BoxDecoration(
color: Colors.green,
borderRadius: BorderRadius.circular(8),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.5),
blurRadius: 5,
offset: const Offset(0, 2),
),
],
),
child: Center(
child: Text(
'Button 2',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
),
),
SizedBox(height: 15),
GestureDetector(
onTap: () {
// Perform action for button 3
},
child: Container(
width: 372, // Adjust the width as needed
height: 50, // Adjust the height as needed
decoration: BoxDecoration(
color: Colors.red,
borderRadius: BorderRadius.circular(8),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.5),
blurRadius: 5,
offset: const Offset(0, 2),
),
],
),
child: Center(
child: Text(
'Button 3',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
),
),
SizedBox(height: 15),
GestureDetector(
onTap: () {
// Perform action for button 4
},
child: Container(
width: 372, // Adjust the width as needed
height: 50, // Adjust the height as needed
decoration: BoxDecoration(
color: Colors.orange,
borderRadius: BorderRadius.circular(20),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.5),
blurRadius: 5,
offset: const Offset(0, 2),
),
],
),
child: Center(
child: Text(
'Button 4',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
),
),
],
),
),
),*/
