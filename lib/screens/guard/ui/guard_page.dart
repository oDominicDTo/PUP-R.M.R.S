import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';
import 'history_page.dart';
import 'package:appdevelopment/screens/faculty/ui/notification_page.dart';
import 'settings_page.dart';
import 'home_page.dart';

class GuardPage extends StatefulWidget {
  const GuardPage({Key? key}) : super(key: key);

  @override
  State<GuardPage> createState() => _GuardPageState();
}

class _GuardPageState extends State<GuardPage> {
  int index = 0;
  final screens = [
    const GuardHomePage(),
    const HistoryPage(),
     NotificationPage(),
    const SettingsPage(),
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
                icon: Icon(Icons.history_outlined),
                selectedIcon: Icon(
                  Icons.history,
                  color: kDarkRed,
                ),
                label: 'History',
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
