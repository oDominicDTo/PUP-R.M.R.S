import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/welcome-login/controllers/login_controller.dart';

import 'forget_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final Size size = MediaQuery.of(context).size;
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
                    height: size.height * 0.34,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 100,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Welcome Back!\n',
                  style: TextStyle(
                    fontSize: 25,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Inter',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in to continue',
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
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(18),
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 20,
                              left: 110,
                              child: Image.asset(
                                'assets/loginLogo.png',
                                width: 150,
                                height: 63,
                              ),
                            ),
                            Positioned(
                              top: 110,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.mail_outline,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        width: 300,
                                        child: TextFormField(
                                          cursorColor: Colors.grey,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                          controller: controller.email,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'example@gmail.com',
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty ) {
                                              return 'Please enter an email';
                                            } if (!value.contains('@')) {
                                              return 'Please enter a valid email';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.password_sharp,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        width: 300,
                                        child: TextFormField(
                                          obscureText: !controller.showPassword.value,
                                          cursorColor: Colors.grey,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20,
                                            letterSpacing: 1.4,
                                          ),
                                          controller: controller.password,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '...........',
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                controller.showPassword.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                controller.togglePasswordVisibility();
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter a password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .8,
                                    child: const Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 250,
                              left: 20,
                              child: SizedBox(
                                width: size.width * .8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => FractionallySizedBox(
                                            heightFactor: 0.6,
                                            child: Container(
                                              padding: const EdgeInsets.all(30),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Reset Password",
                                                    style: Theme.of(context).textTheme.headlineMedium,
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Text(
                                                    "Select the option given below to reset your password.",
                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                  ),
                                                  const SizedBox(height: 30.0),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => const ForgetPasswordScreen(),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.all(20.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Colors.grey.shade200,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Icon(Icons.mail_outline_rounded, size: 60.0),
                                                          const SizedBox(width: 10.0),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("E-Mail", style: Theme.of(context).textTheme.titleLarge),
                                                              Text("Reset via E-Mail Verification", style: Theme.of(context).textTheme.bodyMedium),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 310,
                              left: 20,
                              child: Container(
                                alignment: Alignment.center,
                                width: size.width * .8,
                                child: ElevatedButton(
                                  onPressed: () => controller.login(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kDarkRed,
                                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
