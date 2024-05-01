import 'package:flutter/material.dart';
import 'package:project/pages/filldetails.dart';
import 'package:project/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/register_page.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vehicle',
        home: const HomePage(),
        routes: {
          '/login_page': (context) => const LoginPage(),
          '/register_page': (context) => RegisterPage(),
          '/addproduct': (context) => const FillDetails(),
          '/homepage': (context) => const HomePage(),
        });
  }
}
