import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final RxBool showPassword = false.obs;
  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  void _onPasswordFocusChange() {
    if (!passwordFocusNode.hasFocus) {
      showPassword.value = false;
    }
  }

  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
    if (showPassword.value) {
      FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
    } else {
      // Requesting focus on another field to dismiss the keyboard
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      String? error =
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      if (error != null) {
        Get.snackbar(
          'Error',
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim());
      Get.back(); // Close the dialog
      Get.snackbar('Success!', 'Password Reset Email Sent', snackPosition: SnackPosition.BOTTOM);
      Get.until((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {

      Get.snackbar('Error', e.message ?? 'Unknown error occurred', snackPosition: SnackPosition.BOTTOM);

    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    super.dispose();
  }
}