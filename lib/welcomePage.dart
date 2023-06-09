import 'package:appdevelopment/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
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
            color: Colors.red.withOpacity(0.25),
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
                FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:kPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: kBackgroundColor),
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
    );
  }
}
