import 'package:flutter/material.dart';
// ignore: must_be_immutable
class LikeButton extends StatelessWidget {
  final bool wishlist;
void Function()? onTap;
  LikeButton({super.key,
   required this.wishlist,
   required this.onTap,});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child : Icon(
        wishlist ? Icons.favorite : Icons.favorite_border,
        color: wishlist ?Colors.red: Colors.grey,
      ),
    );
  }
}