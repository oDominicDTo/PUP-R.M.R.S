import 'package:flutter/material.dart';
import 'constants.dart';

class ProfSubSelect extends StatefulWidget {
  const ProfSubSelect({Key? key}) : super(key: key);

  @override
  _ProfSubSelectState createState() => _ProfSubSelectState();
}

class _ProfSubSelectState extends State<ProfSubSelect> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
      body:Container(
        color: kMainPrimaryColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kDarkRed.withOpacity(0.5), // Adjust the opacity as desired
                  BlendMode.srcATop,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/pupbg.png',
                    fit: BoxFit.cover,
                    height: size.height * 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),

      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF7E0001), // Color of the selected icon and label
        unselectedItemColor: Colors.grey, // Color of the unselected icons and labels
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Style for the selected label
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), // Style for the unselected labels
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
