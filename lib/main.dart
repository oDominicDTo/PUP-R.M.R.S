import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/login_page.dart';
import 'package:appdevelopment/prof_sub_select.dart';
import 'package:appdevelopment/welcome_page.dart';
import 'package:flutter/material.dart';
//try
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
      title: 'PUP R.M.R.S',
      theme: ThemeData(

        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const ProfSubSelect(),
    );
  }
}




