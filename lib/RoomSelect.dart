import 'package:flutter/material.dart';
import 'constants.dart';

class RoomSelect extends StatefulWidget {
  const RoomSelect({Key? key}) : super(key: key);

  @override
  _RoomSelectState createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          Positioned(
            top: 100,
            left: 20,
            child: SizedBox(
              width: 150,
              height: 170,
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFF6D1E1E),
                ),
                child: Column(
                    children:[
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
                        height:50,
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
                            children:[
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
                            ]
                        ),
                      ),
                    ]
                ),

              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: SizedBox(
              width: 150,
              height: 170,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFF6D1E1E),
                ),
                child: Column(
                    children:[
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
                        height:50,
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
                            children:[
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
                            ]
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 180,
            left: 20,
            child: SizedBox(
              width: 150,
              height: 170,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFF6D1E1E),
                ),
                child: Column(
                    children:[
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 150,
                        height:50,
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
                            children:[
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
                            ]
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 180,
            right: 20,
            child: SizedBox(
              width: 150,
              height: 170,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFF6D1E1E),
                ),
                child: Column(
                    children:[
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 150,
                        height:50,
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
                            children:[
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Comlab\n\t\t\t1-3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF7E0001),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
