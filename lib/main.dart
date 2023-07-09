import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/firebase_options.dart';
import 'package:appdevelopment/screens/welcome-login/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//try
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PUP R.M.R.S',
      theme: ThemeData(

        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}




