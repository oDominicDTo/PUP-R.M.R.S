import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/ui/floor_selection.dart';
import '../../../constants.dart';
class AddBuilding extends StatefulWidget {
  const AddBuilding({Key? key}) : super(key: key);

  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Choose Building',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context) => FloorSelection()));
                    },
                    child: Container(
                      width: 303,
                      height: 287,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5B0101), // Change the color here
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 268,
                            height: 218,
                            child: Image.asset(
                              'assets/pupbuilding1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Building A',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle the image click here
                      print('Building B clicked');
                    },
                    child: Container(
                      width: 303,
                      height: 287,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5B0101),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 268,
                            height: 218,
                            child: Image.asset(
                              'assets/pupbuilding2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Building B',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
