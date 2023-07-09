import 'package:appdevelopment/screens/welcome-login/login_page.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
                ElevatedButton(
                  onPressed: () {
                    // Button action goes here
                    Navigator.push(
                        context,MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    side: const BorderSide(width: 1.5, color: kBackgroundColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Guard",
                    style: TextStyle(
                      fontSize: 18,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    // Button action goes here
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    side: const BorderSide(width: 1.5, color: kBackgroundColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                  ),
                  child: const Text(
                    "Faculty",
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

