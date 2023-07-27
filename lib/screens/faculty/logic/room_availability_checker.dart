import 'package:appdevelopment/models/retrieve_reservation_model.dart';

class RoomAvailabilityChecker {
  static bool isRoomAvailable(
      String roomName,
      DateTime selectedInitialTime,
      DateTime selectedFinalTime,
      List<RetrieveReservation> allReservations,
      String reservationId,
      ) {
    final initialTime = selectedInitialTime;
    final finalTime = selectedFinalTime;

    for (final reservation in allReservations) {
      if (reservation.id == reservationId) {
        // Skip the reservation being modified (identified by its document ID)
        continue;
      }

      final reservationInitialTime = reservation.initialTime.toDate();
      final reservationFinalTime = reservation.finalTime.toDate();

      // Check for conflicts
      if ((initialTime.isBefore(reservationFinalTime) && finalTime.isAfter(reservationInitialTime)) ||
          (initialTime.isAtSameMomentAs(reservationFinalTime) || finalTime.isAtSameMomentAs(reservationInitialTime))) {
        return false; // Room is not available
      }
    }

    // Check if the room is available at the specific selected time
    return true; // Room is available
  }
}
