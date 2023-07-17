import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfSubSelect extends StatefulWidget {
  const ProfSubSelect({Key? key}) : super(key: key);

  @override
  _ProfSubSelectState createState() => _ProfSubSelectState();
}

class _ProfSubSelectState extends State<ProfSubSelect> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: kMainPrimaryColor,
      body:Container(
        color: kMainPrimaryColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kDarkRed.withOpacity(0.5), // Adjust the opacity as desired
                  BlendMode.srcATop,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/pupbg.png',
                    fit: BoxFit.cover,
                    height: size.height * 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
