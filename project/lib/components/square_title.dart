import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final Function()? onTap;

  final String imagePath;
 const SquareTile({super.key, 
  required this.onTap,
   required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Image.asset(imagePath,height: 40,),
        ),
      ),
    );
  }
}
