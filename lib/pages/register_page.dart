import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/register_controller.dart';
import 'package:project/components/my_button.dart';
import 'package:project/components/my_textfield.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
const BackgroundImage(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'lib/images/logo.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Mobile Garage",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 40,
                    ),
                  ),
                 
                    MyTextField(
                      hintText: 'First Name',
                      obscureText: false,
                      controller: registrationController.fnamecontoller,
                      icontype: Icons.mail,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      hintText: 'Last Name',
                      obscureText: false,
                      controller: registrationController.lnamecontroller,
                      icontype: Icons.mail,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      hintText: 'Address',
                      obscureText: false,
                      controller: registrationController.addresscontroller,
                      icontype: Icons.mail,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      hintText: 'Phone',
                      obscureText: false,
                      controller: registrationController.phonecontroller,
                      icontype: Icons.mail,
                    ),
                  const SizedBox(height: 5), 
                   MyTextField(
                    hintText: 'Email',
                    obscureText: false,
                    controller: registrationController.emailController,
                    icontype: Icons.mail,
                  ),
                  const SizedBox(height: 5),
                  MyTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: registrationController.passwordController,
                    icontype: Icons.lock,
                  ),
                  
   const SizedBox(height: 5),
                    MyTextField(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller:
                          registrationController.confirmpasswordController,
                      icontype: Icons.mail,
                    ),
                    const SizedBox(height: 5),
                  MyButton(
                    onTap: () => registrationController.register(),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
