import 'package:flutter/material.dart';
import 'package:project/components/my_button.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //icon
      const Icon(
        Icons.shopping_bag,
        size: 70,
      ),
      const SizedBox(height: 25),
      //title
      const Text(
        'WatchWorks',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
      const SizedBox(height: 10),

        //subtitle
        const Text("Premium Quality Products",
        style: TextStyle(
        ),
        ),

      const SizedBox(height: 20),

        //button
MyButton(
  onTap:() => Navigator.pushNamed(context, 'LoginRegister()'),
   child:const Icon(
  Icons.arrow_forward
),)
      ],
        ),
      ),
    );
  }
}