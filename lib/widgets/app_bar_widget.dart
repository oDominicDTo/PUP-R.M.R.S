import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    EdgeInsets padding;
    if (screenHeight <= 730) { // 5.5-inch screen height in logical pixels
      padding = const EdgeInsets.fromLTRB(0, 31, 0, 8); // Specific padding for 5.5-inch screen
    } else {
      padding = const EdgeInsets.fromLTRB(0, 40, 0, 8); // Default padding for other screen sizes
    }

    return AppBar(
      backgroundColor: const Color(0xFFF0F0F0),
      flexibleSpace: Column(
        children: [
          Expanded(
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/puplogo.png', // Replace with your logo image path
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PUP R.M.R.S', // Replace with your logo title
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
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

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
