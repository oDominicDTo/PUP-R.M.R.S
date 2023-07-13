import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/firebase_options.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_page.dart';
import 'package:appdevelopment/screens/guard/guard_page.dart';
import 'package:appdevelopment/screens/welcome-login/ui/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//try
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PUP R.M.R.S',
      theme: ThemeData(

        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const CircularProgressIndicator(),
    );
  }
}




