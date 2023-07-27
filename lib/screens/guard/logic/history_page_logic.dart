import 'package:intl/intl.dart';
import 'package:appdevelopment/models/retrieve_reservation_model.dart';

class HistoryPageLogic {
  static String getCurrentDate(DateTime selectedDate) {
    return DateFormat('MMMM dd, yyyy').format(selectedDate);
  }

  static List<RetrieveReservation> getFilteredRooms(
      DateTime selectedDate,
      List<RetrieveReservation> allReservations,
      ) {
    return allReservations.where((room) {
      final reservationDate = room.reservationDate.toDate();
      return reservationDate.year == selectedDate.year &&
          reservationDate.month == selectedDate.month &&
          reservationDate.day == selectedDate.day;
    }).toList();
  }
}