import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(18),
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Your',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffff4590),
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' workout partner',
                                style: TextStyle(
                                  color: Colors.black87,
                                ))
                          ])),
                ),
                Container(
                  
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pupbg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

            Container(
              color: Colors.red.withOpacity(0.25),
            ),

                Container(
                  height: size.height * .3,
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
                      ]),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          'Login Here',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
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
                          )),
                      Positioned(
                          top: 120,
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
                          )),
                      Positioned(
                          top: 180,
                          left: 20,
                          child: SizedBox(
                            width: size.width * .8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Forgot Details',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: -30,
                        right: 30,
                        child: Container(
                          padding: const EdgeInsets.all(22),
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff382743),
                                  Color(0xffff4590),
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/right-arrow.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}