import 'package:flutter/material.dart';

class FillDetails extends StatelessWidget {
   FillDetails({super.key});
final titlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upload Photo',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
             const Text('Next Step',
        style: TextStyle(
          fontSize: 20,
        ),
        ),
           const  SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: titlecontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
            ),
            
          ),
          
          ),
        ),
        ],
        
        ),
      ),
    );
  }
}