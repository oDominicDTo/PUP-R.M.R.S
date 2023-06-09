import 'package:appdevelopment/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PUP R.A.M.S',
      theme: ThemeData(

        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
      Container(
      decoration: BoxDecoration(
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
              Image.asset("assets/puplogo.png", width: 100, height: 100,),
              SizedBox(height: 30,),
              Text(
                "Welcome to \nPUPBC ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 52,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'
                ),
              ),
              Text(
                "Room Monitoring Application",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
              ),
              // Additional content widgets here
            ],
          ),
        ),
    ],
      ),
    );
  }
}



