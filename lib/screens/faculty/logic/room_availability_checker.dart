import '../models/retrieve_reservation_model.dart';

class RoomAvailabilityChecker {
  static bool isRoomAvailable(
      String? roomName,
      DateTime selectedInitialTime,
      DateTime selectedFinalTime,
      List<RetrieveReservation> allReservations,
      String professorId,
      ) {
    final initialTime = selectedInitialTime;
    final finalTime = selectedFinalTime;

    for (final reservation in allReservations) {
      if (reservation.id == roomName) {
        // Skip the current reservation being modified
        continue;
      }

      if (reservation.roomName == roomName && reservation.professorId != professorId) {
        // Check for conflicts with other reservations for the same room, but not made by the same professor
        final reservationInitialTime = reservation.initialTime.toDate();
        final reservationFinalTime = reservation.finalTime.toDate();

        if ((initialTime.isBefore(reservationFinalTime) && finalTime.isAfter(reservationInitialTime)) ||
            (initialTime.isAtSameMomentAs(reservationFinalTime) || finalTime.isAtSameMomentAs(reservationInitialTime))) {
          return false; // Room is not available
        }
      }
    }

    // Check if the room is available at the specific selected time
    return true; // Room is available
  }
}

