import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/guard/models/room.dart';

class HistoryPageLogic {
  static String getCurrentDate(DateTime selectedDate) {
    return DateFormat('MMMM dd, yyyy').format(selectedDate);
  }

  static List<Room> getFilteredRooms(DateTime selectedDate) {
    return rooms.where((room) {
      return room.date.year == selectedDate.year &&
          room.date.month == selectedDate.month &&
          room.date.day == selectedDate.day;
    }).toList();
  }
}
