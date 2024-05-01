import 'package:flutter/material.dart';
import 'package:project/components/drawer_list.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onSignout;

  const MyDrawer({
    super.key,
    required this.onSignout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: ClipOval(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.white,
                  child: Image.asset(
                    'lib/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'My Services',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          MyListTile(
              text: "My Vehicles",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),
          MyListTile(
              text: "Offers",
              icon: Icons.car_rental_outlined,
              onTap: () => Navigator.pop(context)),
          const Divider(),
          Column(
            children: [
              const Text(
                'Account Services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyListTile(
                text: 'My Account',
                icon: Icons.account_box,
                onTap: onSignout,
              ),
              MyListTile(
                text: 'Logout',
                icon: Icons.logout,
                onTap: onSignout,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
