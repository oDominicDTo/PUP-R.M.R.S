import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/screens/welcome-login/ui/welcome_page.dart';
import 'package:appdevelopment/screens/guard/ui/guard_page.dart';
import 'package:appdevelopment/screens/faculty/ui/prof_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      route();
    }
  }

  void route() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    if (documentSnapshot.exists) {
      String role = documentSnapshot.get('userType');
      if (role == "guard") {
        Get.offAll(() => const GuardPage());
      } else if (role == "professor") {
        Get.offAll(() => const ProfPage());
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    } else {
      print('Document does not exist in the database');
    }
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      route();
      return null; // Return null when login is successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not found. Please check your email and password.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password. Please check your email and password.';
      } else {
        return 'An error occurred. Please try again later.';
      }
    } catch (_) {
      return 'An error occurred. Please try again later.';
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
