
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/auth/login_or_register.dart';
import 'package:project/pages/home_page.dart';

import 'package:flutter/material.dart';
class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot)  {
        //user is logged in
        if(snapshot.hasData){
          return   HomePage();
        }
        //user is Not logged in
        else{
          return const LoginRegister();
        }
      },
      ),
    );
  }
}