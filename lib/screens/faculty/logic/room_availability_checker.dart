/*
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/room_model.dart';

class RoomAvailabilityChecker {
  static bool isRoomAvailable(Room room, DateTime selectedInitialTime, DateTime selectedFinalTime, List<QueryDocumentSnapshot<Map<String, dynamic>>> reservations, String currentProfessorId) {
    final initialTime = room.initialTime.toDate();
    final finalTime = room.finalTime.toDate();

    for (final reservation in reservations) {
      final reservationInitialTime = reservation['initialTime'].toDate();
      final reservationFinalTime = reservation['finalTime'].toDate();
      final professorId = reservation['professorId'];

      // Skip reservations made by the current professor
      if (professorId == currentProfessorId) {
        continue;
      }

      // Check for conflicts
      if ((initialTime.isBefore(reservationFinalTime) && finalTime.isAfter(reservationInitialTime)) ||
          (initialTime.isAtSameMomentAs(reservationFinalTime) || finalTime.isAtSameMomentAs(reservationInitialTime))) {
        return false; // Room is not available
      }
    }

    // Check if the room is available at the specific selected time
    if (selectedInitialTime.isBefore(finalTime) && selectedFinalTime.isAfter(initialTime)) {
      return false; // Room is not available at the selected time
    }

    return true; // Room is available
  }
}
*/
