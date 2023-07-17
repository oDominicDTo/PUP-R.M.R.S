import 'package:appdevelopment/screens/guard/models/room.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:appdevelopment/screens/guard/repository/guard_repository.dart';

class SettingsPageController {
  UserRepository _userRepository = UserRepository();
  User? currentUser;

  Future<void> loadUserData() async {
    final user = await AuthenticationRepository.instance.getCurrentUser();
    if (user != null) {
      final userId = user.uid;
      currentUser = await _userRepository.getUserDetails(userId);
    }
  }
}
