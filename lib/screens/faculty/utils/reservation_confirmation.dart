import 'package:flutter/material.dart';

class ReservationConfirmationState extends ChangeNotifier {
  bool _isRoomConfirmed = false;

  bool get isRoomConfirmed => _isRoomConfirmed;

  void confirmRoom() {
    _isRoomConfirmed = true;
    notifyListeners();
  }
}
