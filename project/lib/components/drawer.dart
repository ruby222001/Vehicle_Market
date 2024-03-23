import 'package:flutter/material.dart';
import 'package:project/components/drawer_list.dart';

class MyDrawer extends StatelessWidget {
      final void Function()? onSignout;

  const MyDrawer({super.key,
    required this.onSignout,
});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      
     child: Column(
      children: [
        const DrawerHeader(
          child:Center(
            child:  Icon(Icons.home),
            
          ),
          
        ),
          const SizedBox(height: 25),
        MyListTile(text: "H O M E", icon: Icons.home, onTap: ()=> Navigator.pop(context)),
                MyListTile(text: "C A R", icon: Icons.car_rental_outlined, onTap: ()=> Navigator.pop(context)),

        MyListTile(text: "B I K E", icon: Icons.bike_scooter, onTap: ()=> Navigator.pop(context)),
  Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: MyListTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: onSignout,
          ),
        ),
      ],
     ),
    
    );
  }
}