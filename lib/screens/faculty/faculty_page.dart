import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';
import 'history_page.dart';
import 'notification_page.dart';
import 'settings_page.dart';
import 'home_page.dart';


class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
int index = 0;
  final screens = [
    const FacultyHomePage(),
    const HistoryPage(),
    const NotificationPage(),
    const SettingsPage(),
];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: const AppBarWidget(),
      body: screens[index],
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
              NavigationDestination(icon: Icon(Icons.history_outlined), selectedIcon: Icon(Icons.history, color: kDarkRed,),label: 'History'),
              NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications, color: kDarkRed,), label: 'Notification'),
              NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings, color: kDarkRed,), label: 'Settings'),
            ],
        ),
      ),
    );
  }
}


