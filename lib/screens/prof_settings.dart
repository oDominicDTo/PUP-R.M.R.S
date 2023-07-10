import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';
class prof_settings extends StatefulWidget {
  const prof_settings({Key? key}) : super(key: key);

  @override
  _prof_settingsState createState() => _prof_settingsState();
}

class _prof_settingsState extends State<prof_settings> {
  int index = 3;



  @override
  Widget build(BuildContext context) {
    appBar: const AppBarWidget();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 7.0, left: 5.0),
              child: Image.asset(
                'assets/puplogo.png',
                width: 45,
                height: 45,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 13.0),
              child: const Text(
                'PUP R.M.R.S',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF7E0001),
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kMainPrimaryColor,

      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 360,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xFF5B0101),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your own image //make it dynamically replace user image
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'john.doe@example.com',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 10,
            child: Column(
              children: [
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for the first rectangle
                    print('First rectangle tapped');
                  },
                  child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Change Profile Picture',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for the second rectangle
                    print('Second rectangle tapped');
                  },
                  child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.shield,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for the third rectangle
                    print('Third rectangle tapped');
                  },
                  child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
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
          ),

        ],

      ),


      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.white10,
          labelTextStyle: MaterialStatePropertyAll(TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal, color: Color(0xFF5B0101))),


        ),
        child: NavigationBar(
          height: 92,
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (index)=> setState(()=> this.index=index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: kDarkRed,), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.add_outlined), selectedIcon: Icon(Icons.add, color: kDarkRed,),label: 'Add'),
            NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications, color: kDarkRed,), label: 'Notification'),
            NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings, color: kDarkRed,), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
