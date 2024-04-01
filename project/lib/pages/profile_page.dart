import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/components/mytextbox.dart';

class ProfilePage extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser!;

Future<void> editField(String field) async{

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      bottomNavigationBar: const BottomNavigator(),
      body: ListView(
        children: [
          const Icon(
            Icons.person,
            size: 72,
          ),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'My Details',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          MyTextBox(
            text: 'ruby', sectionname: 'username',
          onPressed:()=> editField('username') ,
          ),

        ],
      ),
    );
  }
}
