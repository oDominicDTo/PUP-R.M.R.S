import 'package:flutter/material.dart';
import 'constants.dart';

class ProfDashBoard extends StatelessWidget {
  const ProfDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
      ),
      child: Scaffold(
      appBar: AppBar(
        title: const Text('PUP R.M.R.S',style: TextStyle(
            fontSize: 20,
            color: Color(0xFF7E0001),
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
        ),
        ),
        leading: Container(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0), // Adjust the padding values as per your desired position
          child: Image.asset(
            'assets/puplogo.png',
            width: 20,

          ),
        ),
      backgroundColor: Colors.white,
      ),
      backgroundColor: kMainPrimaryColor,
    )
    );
  }
}
