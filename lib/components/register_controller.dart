// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final TextEditingController fnamecontoller = TextEditingController();
  final TextEditingController lnamecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void register() async {
    String firstname = fnamecontoller.text;
    String lastname = lnamecontroller.text;
    String address = addresscontroller.text;
    String mobile = phonecontroller.text;
    String email = emailController.text;
    String password = passwordController.text;
    String passwordconfirm = confirmpasswordController.text;

    if (firstname.isEmpty ||
        lastname.isEmpty ||
        address.isEmpty ||
        mobile.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordconfirm.isEmpty) {
      print('errorr');
      return;
    }

    // Check if passwords match
    if (password != passwordconfirm) {
      print('password not match');
      return;
    }

    var registrationData = {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'mobile': mobile,
      'password': password,
      'password_confirm': passwordconfirm,
    };

    // Convert registration data to JSON string
    String requestBody = json.encode(registrationData);

    _setHeaders() => {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
    print('Request Body: $registrationData');
    try {
      var response = await http.post(
        Uri.parse('https://www.mobilegaragenepal.com/api/users/create'),
        body: requestBody,
        headers: _setHeaders(),
      );

      if (response.statusCode == 200) {
        // Extract JSON part of the response
        var jsonString = response.body.substring(response.body.indexOf('{'));
        var responseData = json.decode(jsonString);

        print('Registration successful!');
        print('User ID: ${responseData['id']}');
        print('User Name: ${responseData['name']}');
        Get.offAllNamed('/homepage');
      } else {
        // response is in JSON format or not
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          // Extract JSON part of the response
          var jsonString = response.body.substring(response.body.indexOf('{'));
          var errorResponse = json.decode(jsonString);

          print('Registration failed: ${errorResponse}');
        } else {
          // Handle non-JSON response
          print('Registration failed: ${response.body}');
        }
      }
    } on http.ClientException catch (e) {
      print('HTTP Client Exception: $e');
    } catch (e) {
      print('Error: $e');
    }
  }
}
