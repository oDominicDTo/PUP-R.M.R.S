import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/widgets/app_bar_widget.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const Scaffold(

      body: Text('Settings'), backgroundColor: Color(0xFFF0F0F0),
    );
  }
}


