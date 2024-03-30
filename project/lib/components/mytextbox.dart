import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
final Function()? onPressed;
  final String sectionname;

  const MyTextBox({super.key,
  required this.text,
  required this.sectionname,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
        
      ),
      padding:const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      
      margin: const EdgeInsets.only( left: 20, right: 20,top: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        //section naem
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(sectionname),
    IconButton(onPressed: onPressed, icon: Icon(Icons.settings,
    color: Colors.grey[400],
    ),
    ),
  ],
),
        //text
Text(text),

      ],)
    );
  }
}