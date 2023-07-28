import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/welcome-login/controllers/login_controller.dart';
import 'package:appdevelopment/screens/welcome-login/ui/login_page.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  void _navigateBackToLogin() {
    // Pop the current screen (reset password) and go back to the login screen
    Get.off(LoginPage());

  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final Size size = MediaQuery.of(context).size;
    final bool isLandscape = size.width > size.height;
    final double heightFactor = isLandscape ? 0.5 : 0.34;
    final double contentWidth = isLandscape ? size.height : size.width;
    final double contentHeight = isLandscape ? size.width : size.height;

    return Scaffold(
      body: Container(
        color: kMainPrimaryColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kDarkRed.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    'assets/pupbg2.png',
                    fit: BoxFit.cover,
                    width: contentWidth,
                    height: contentHeight * heightFactor,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: contentWidth * 0.9, // Limiting the width to 80% of the available screen width
                  child: Container(
                    padding: EdgeInsets.all(contentWidth * 0.01),
                    height: contentHeight,
                    child: Stack(
                      alignment: Alignment.center, // Align the white box in the center
                      children: [
                        Positioned(
                          top: contentHeight * 0.1, // Adjust vertical position of 'Forget Password!' and 'Enter your Email'
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Forget Password!\n',
                              style: TextStyle(
                                fontSize: 25,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Inter',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Enter your Email',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: contentHeight * 0.25, // Adjust vertical position of white box
                          child: Container(
                            height: contentHeight * 0.46,
                            width: contentWidth * 0.9, // Width of the white box
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  spreadRadius: 2,
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  SizedBox(height: contentHeight * 0.03),
                                  Image.asset(
                                    'assets/loginLogo.png',
                                    width: contentWidth * 0.45,
                                    height: contentHeight * 0.1,
                                  ),
                                  SizedBox(height: contentHeight * 0.03),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: contentWidth * 0.05),
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                      controller: controller.emailController,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.mail_outline, color: Colors.grey),
                                        border: OutlineInputBorder(),
                                        hintText: 'example@gmail.com',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: contentHeight * 0.03),
                                  ElevatedButton(
                                    onPressed: () => controller.resetPassword(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kDarkRed,
                                      padding: EdgeInsets.symmetric(horizontal: contentWidth * 0.2, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      "Reset",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: contentHeight * 0.03),
                                  TextButton(
                                    onPressed: _navigateBackToLogin, // Call the custom function to navigate back to the login screen
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kDarkRed,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: contentHeight * 0.03),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
