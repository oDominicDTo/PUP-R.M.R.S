import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/guard/ui/view_users.dart';
import 'package:appdevelopment/screens/guard/controller/guard_controller.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsPageController _guardController = SettingsPageController();

  @override
  void initState() {
    super.initState();
    _guardController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainPrimaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: const BoxDecoration(
                  color: kDarkRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(height: 10),
                    Text(
                      _guardController.currentUser != null ? _guardController.currentUser!.name : '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perform action for button 1
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewUsersPage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
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
                            Icon(Icons.people, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'View Users',
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
                      width: double.infinity,
                      height: 50,
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
                      width: double.infinity,
                      height: 50,
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
