import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/components/drawer.dart';
import 'package:project/pages/filldetails.dart';

class MyVehicles extends StatefulWidget {
  const MyVehicles({super.key});

  @override
  State<MyVehicles> createState() => _MyVehiclesState();
}

class _MyVehiclesState extends State<MyVehicles> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(
          onSignout: () {},
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const BottomNavigator(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(
                    'My Vehicles',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FillDetails()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
