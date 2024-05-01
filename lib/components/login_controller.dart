// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final TextEditingController loginemailcontroller = TextEditingController();
  final TextEditingController loginpasswordcontroller = TextEditingController();

  void login() async {
    String email = loginemailcontroller.text;
    String password = loginpasswordcontroller.text;

    if (email.isEmpty || password.isEmpty) {
      print('Email: $email, Password: $password');

      Get.snackbar(
        'Error',
        'Please enter both email and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    var logindata = {
      'email': email,
      'password': password,
    };

    // Convert registration data to JSON string
    String requestBody = json.encode(logindata);

    _setHeaders() => {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
    print('Request Body: $logindata');

    try {
      // Send HTTP request
      var response = await http.post(
        Uri.parse('https://www.mobilegaragenepal.com/api/users/login'),
        body: requestBody,
        headers: _setHeaders(),
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        var jsonString = response.body.substring(response.body.indexOf('{'));
        var responseData = json.decode(jsonString);

        print('login successful!');

        Get.offAllNamed('/homepage');
      } else {
        handleErrorResponse(response);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void handleErrorResponse(http.Response response) {
    if (response.statusCode == 404) {
      print('Error 404: Not Found');
    } else if (response.statusCode == 500) {
      print('Error 500: Internal Server Error');
    } else {
      print('Error ${response.statusCode}: ${response.body}');
    }
  }
}
