import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/login_controller.dart';
import 'package:project/components/my_button.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/pages/forgot_password.dart';
import 'package:project/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(fit: StackFit.expand, children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //logo
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'lib/images/logo.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Mobile Garage",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 40),
                  ),
                  const SizedBox(height: 30),

                  //email textfield
                  MyTextField(
                    icontype: Icons.mail,
                    hintText: 'Email',
                    obscureText: false,
                    controller: loginController.loginemailcontroller,
                  ),
                  const SizedBox(height: 10),

                  //password
                  MyTextField(
                    icontype: Icons.lock,
                    hintText: 'Password',
                    obscureText: true,
                    controller: loginController.loginpasswordcontroller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Forgotpasswordpage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: () => loginController.login(),
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 20),
                  //don't have an account? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ));
                        },
                        child: const Text(
                          "Register Here",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
