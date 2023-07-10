import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
class floor_selection extends StatefulWidget {
  const floor_selection({Key? key}) : super(key: key);

  @override
  _floor_selectionState createState() => _floor_selectionState();
}

class _floor_selectionState extends State<floor_selection> {
  int index = 1;



  @override
  Widget build(BuildContext context) {
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
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            child: Text(
              'Building A',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
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
                      color: Color(0xFF6D1E1E),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          '1st',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                                  fontSize: 14,
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
                      color: Color(0xFF6D1E1E),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          '2nd',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                                  fontSize: 14,
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
                  bottom: 145,
                  left: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF6D1E1E),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          '3rd',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                                  fontSize: 14,
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
                  bottom: 145,
                  right: 20,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Color(0xFF6D1E1E),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          '4th',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Text(
                          'FLOOR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                                  fontSize: 14,
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

      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.white10,
          labelTextStyle: MaterialStatePropertyAll(TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal)),


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
