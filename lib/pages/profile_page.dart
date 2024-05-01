import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/components/drawer.dart';
import 'package:project/components/floatingactionbutton.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onSignout: () {},
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const BottomNavigator(),
      body: Stack(children: [
        const BackgroundImage(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Mobile Garage',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/images/logo.png'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Edit Profile',
                ),
              ),
            ),
          ],
        ),
      ]),
      floatingActionButton: const CircularFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
