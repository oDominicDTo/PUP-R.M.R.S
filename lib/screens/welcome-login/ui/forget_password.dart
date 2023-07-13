import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/welcome-login/controllers/login_controller.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                                          controller: controller.emailController,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'example@gmail.com',
                                          ),
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
                              top: 310,
                              left: 20,
                              child: Container(
                                alignment: Alignment.center,
                                width: size.width * .8,
                                child: ElevatedButton(
                                  onPressed: () => controller.resetPassword(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kDarkRed,
                                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
