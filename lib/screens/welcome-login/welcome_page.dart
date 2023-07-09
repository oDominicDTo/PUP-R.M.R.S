import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/welcome-login/second_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pupbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: kDarkRed.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Image.asset("assets/puplogo.png", width: 100, height: 100,),
                const SizedBox(height: 30,),
                const Text(
                  "Welcome to \nPUPBC ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 52,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                  ),
                ),
                const Text(
                  "Room Monitoring Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                  ),
                ),
                const SizedBox(height: 200,),
                ElevatedButton(
                  onPressed: () {
                    // Button action goes here
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                    side: const BorderSide(width: 1.5, color: kBackgroundColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
