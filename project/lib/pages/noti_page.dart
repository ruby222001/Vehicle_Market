import 'package:flutter/material.dart';

class NotiificationPage extends StatelessWidget {
  const NotiificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: const Center(
        child: Text('Notification Page Content'),
      ),
    );
  }
}

