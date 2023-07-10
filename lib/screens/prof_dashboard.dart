import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';

class ProfHomeDB extends StatefulWidget {
  const ProfHomeDB({Key? key}) : super(key: key);

  @override
  _ProfHomeDBState createState() => _ProfHomeDBState();
}

class _ProfHomeDBState extends State<ProfHomeDB> {
  int index = 0;



  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final monthNames = [
      '', // Leave an empty string at index 0 to align with month numbers
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
    final formattedDate = '${monthNames[currentDate.month]} ${currentDate.day}, ${currentDate.year}';

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
              'Today: $formattedDate',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.white10,
          labelTextStyle: MaterialStatePropertyAll(TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal,color: Color(0xFF5B0101))),


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
