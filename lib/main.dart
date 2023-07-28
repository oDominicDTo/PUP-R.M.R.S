import 'package:appdevelopment/api/firebase_api.dart';
import 'package:appdevelopment/constants.dart';
import 'package:flutter/services.dart';
import 'package:appdevelopment/firebase_options.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PUP R.M.R.S',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: const Center(child: CircularProgressIndicator()),
    );
  }
}
