import 'package:intl/intl.dart';
import 'package:appdevelopment/screens/guard/models/room.dart';

class GuardHomeLogic {

  List<Room> filteredRooms = []; // Filtered list of rooms
  String searchQuery = '';

  void onSearchQueryChanged(String value) {
    searchQuery = value;
    filterRooms();
  }

  void filterRooms() {
    final currentDate = DateTime.now();

    filteredRooms = rooms
        .where((room) =>
    room.date.year == currentDate.year &&
        room.date.month == currentDate.month &&
        room.date.day == currentDate.day)
        .toList();

    if (searchQuery.isNotEmpty) {
      final lowerCaseQuery = searchQuery.toLowerCase();
      filteredRooms = filteredRooms
          .where((room) =>
      room.roomName.toLowerCase().contains(lowerCaseQuery) ||
          room.subjectName.toLowerCase().contains(lowerCaseQuery) ||
          room.course.toLowerCase().contains(lowerCaseQuery) ||
          room.professorName.toLowerCase().contains(lowerCaseQuery))
          .toList();
    }
  }

  String getCurrentDate() {
    final currentDate = DateTime.now();
    return DateFormat('MMMM dd, yyyy').format(currentDate);
  }
}
