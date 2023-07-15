import 'package:appdevelopment/screens/faculty/ui/add_building.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_dashboard.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_notification_page.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_settings.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';
import 'package:appdevelopment/screens/faculty/ui/floor_selection.dart';


class ProfPage extends StatefulWidget {
  const ProfPage({Key? key}) : super(key: key);

  @override
  State<ProfPage> createState() => _ProfPageState();
}

class _ProfPageState extends State<ProfPage> {
  int index = 0;
  final screens = [
    const ProfHomeDB(),
    const AddBuilding(),
    const ProfNotificationPage(),
    const ProfSettings(),
    const FloorSelection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,  // Replace with the color you desire for the stroke
              width: 1,  // Adjust the width as needed
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorColor: Colors.white10,
            labelTextStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          child: NavigationBar(
            height: 75,
            backgroundColor: Colors.white,
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(
                  Icons.home,
                  color: kDarkRed,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_box_outlined),
                selectedIcon: Icon(
                  Icons.add_box_rounded,
                  color: kDarkRed,
                ),
                label: 'Add',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(
                  Icons.notifications,
                  color: kDarkRed,
                ),
                label: 'Notification',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(
                  Icons.settings,
                  color: kDarkRed,
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
