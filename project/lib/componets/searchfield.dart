import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
   SearchBox({super.key});
final TextEditingController _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _textcontroller,
        
        decoration: const InputDecoration(
          border: OutlineInputBorder(
      
          ),
          suffixIcon: Icon(Icons.search),
          hintText: "Search here",
        ),
      ),
    );
  }
}