import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData icontype;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.icontype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Icon(icontype, color: Colors.white),               ),
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
