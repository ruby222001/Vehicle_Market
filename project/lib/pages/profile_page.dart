import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/bottom_navigator_bar.dart';

class ProfilePage extends StatelessWidget {

    final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
            bottomNavigationBar: const BottomNavigator(),

      body: Center(
        child:           Row(
          children: [
                         Text(currentUser.email!,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[700]),),

          
            Text(currentUser.email!,textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[700]),),

          
          ],
        )

      ),
    );
  }
}
