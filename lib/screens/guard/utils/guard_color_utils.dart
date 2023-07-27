import 'package:flutter/material.dart';

class ColorUtils {
  static Color? stringToColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null; // or return a default color in case of no color value
    }

    if (!colorString.startsWith('#')) {
      throw FormatException("Invalid color format. Color should start with '#' symbol.");
    }

    // Remove the '#' symbol from the color string
    String cleanedColorString = colorString.replaceFirst('#', '');

    // Ensure that the cleanedColorString has either 6 or 8 hexadecimal characters
    if (cleanedColorString.length != 6 && cleanedColorString.length != 8) {
      throw FormatException("Invalid color format. Color should have 6 or 8 hexadecimal characters.");
    }

    // Parse the cleanedColorString to an integer with radix 16 (hexadecimal)
    int value = int.parse(cleanedColorString, radix: 16);

    // If the colorString had 8 characters, use the last two characters as the alpha value
    int alpha = (cleanedColorString.length == 8) ? value >> 24 : 255;

    // Use bitwise AND operation to extract the RGB values from the integer
    int red = (value >> 16) & 0xFF;
    int green = (value >> 8) & 0xFF;
    int blue = value & 0xFF;

    return Color.fromARGB(alpha, red, green, blue);
  }
}
