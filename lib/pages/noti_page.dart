import 'package:flutter/material.dart';
import 'package:project/components/bottom_navigator_bar.dart';

class NotiificationPage extends StatelessWidget {
  const NotiificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      bottomNavigationBar: const BottomNavigator(),
      body: const Center(
        child: Text('Notification Page Content'),
      ),
    );
  }
}
