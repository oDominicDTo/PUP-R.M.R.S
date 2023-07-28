import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/welcome-login/controllers/login_controller.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
                    height: MediaQuery.of(context).size.height * 0.38,
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 25,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Text(
                        'Log in to continue',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      buildLoginForm(controller),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(LoginController controller) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              Image.asset(
                'assets/loginLogo.png',
                width: size.width * 0.2,
                height: size.height * 0.1,
              ),
              const SizedBox(height: 15),
              TextFormField(
                cursorColor: Colors.grey,
                style: const TextStyle(
                  color: Colors.black54,
                ),
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Colors.grey,
                  ),
                  hintText: 'example@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: !controller.showPassword.value,
                cursorColor: Colors.grey,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  letterSpacing: 1.4,
                ),
                controller: controller.password,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password_sharp,
                    color: Colors.grey,
                  ),
                  hintText: '...........',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showPassword.value ? Icons.visibility : Icons.visibility_off,
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: const EdgeInsets.all(15),
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
                            Expanded(
                              child: ListView(
                                children: [
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("E-Mail", style: Theme.of(context).textTheme.titleLarge),
                                                Text("Reset via E-Mail Verification", style: Theme.of(context).textTheme.titleMedium),
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
                          ],
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
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : () => _handleLogin(controller),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkRed,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                      : const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin(LoginController controller) async {
    setState(() {
      isLoading = true;
    });

    await controller.login();

    setState(() {
      isLoading = false;
    });
  }
}
