import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:
      Container(
        color: kMainPrimaryColor,
        child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    kDarkRed.withOpacity(0.5), // Adjust the opacity as desired
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
                top: 150, // Adjust the top value to move the text upwards
                left: 100, // Adjust the left value to move the text horizontally
                child: SizedBox(
                  width: 200,
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
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 0),
                      Container(
                        height: size.height * 0.45,
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
                                        child: const TextField(
                                          cursorColor: Colors.grey,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                          decoration: InputDecoration(
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
                                        child: const TextField(
                                          obscureText: true,
                                          cursorColor: Colors.grey,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20,
                                            letterSpacing: 1.4,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '...........',
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
                              top: 250,
                              left: 20,
                              child: SizedBox(
                                width: size.width * .8,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(context: context,
                                          builder: (context) => FractionallySizedBox(heightFactor: 0.6, child: Container(
                                          padding: const EdgeInsets.all(30),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [Text("Reset Password", style: Theme.of(context).textTheme.headlineMedium),
                                                const SizedBox(height: 10.0,),
                                                Text("Select the option given below to reset your password.", style: Theme.of(context).textTheme.bodyMedium,),
                                                const SizedBox(height: 30.0,),
                                                GestureDetector(

                                                  onTap: (){
                                                    Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                                                  );},
                                                  child: Container(
                                                    padding: const EdgeInsets.all(20.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Colors.grey.shade200
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        const Icon(Icons.mail_outline_rounded, size:60.0),
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
                                                )
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
                              left: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Button action goes here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kDarkRed,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 16),
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
                                ],
                              ),
                            ),
                          ],
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
