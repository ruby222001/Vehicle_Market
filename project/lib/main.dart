import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/auth/auth.dart';
import 'package:project/firebase_options.dart';
import 'package:project/pages/home_page.dart';


import 'package:project/pages/login_page.dart';
import 'package:project/pages/register_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp()

    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                debugShowCheckedModeBanner: false,
 
      title: 'Vehicle',
      theme: ThemeData.dark(),
            home: const Authpage(),
routes: {
        '/login_page': (context) =>  const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
                '/homepage': (context) =>  HomePage(),

}
    );
      }
      }