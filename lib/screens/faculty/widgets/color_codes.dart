import 'package:flutter/material.dart';

class OverlayPage extends StatelessWidget {
  final double overlayWidth;
  final double overlayHeight;

  OverlayPage({this.overlayWidth = 400, this.overlayHeight = 350});

  @override
  Widget build(BuildContext context) {
    final double circleSize = overlayWidth / 7; // We want 8 circles in a row
    final int totalCircles = 8;
    //final int circlesPerRow = totalCircles ~/ 2; // Half of the circles in each row

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            10), // Manually adjust the border radius to control the size
      ),
      contentPadding:
          EdgeInsets.zero, // Remove default padding around the content
      content: SingleChildScrollView(
        child: Container(
          width: overlayWidth,
          height: overlayHeight,
          child: ListView(
            shrinkWrap: true,
            children: [
              IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top:
                              20), // Adjust the top padding to vertically position the text
                      child: Align(
                        alignment: Alignment
                            .topCenter, // Align the "Color Legend" text to the top center
                        child: Text(
                          'Color Legends',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment
                          .topLeft, // You can adjust the alignment here
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < totalCircles; i++)
                            ColorCircle(
                                size: circleSize,
                                color: colors[i],
                                label: labels[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final double size;
  final Color color;
  final String label;

  ColorCircle({required this.size, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final double fontSize =
        size * 0.22; // Adjust the font size based on the circle's size

    return Padding(
      padding: const EdgeInsets.all(10.0), // Add some padding between circles
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize, // Use the calculated font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Define the colors and labels for the circles
final List<Color> colors = [
  Colors.red,
  Color(0xFF7100C9),
  Colors.blue,
  Color(0xFFFBBC05),
  Color(0xFF00C920),
  Colors.yellow,
  Color(0xFF6A1818),
  Colors.pink,
];

final List<String> labels = [
  'BSIT 1-1',
  'BSIT 2-1',
  'BSIT 3-1',
  'BSIT 4-1',
  'DICT 1-1',
  'DICT 21',
  'DICT 3-1',
  'DICT 4-1',
];
