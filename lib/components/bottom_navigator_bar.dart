import 'package:flutter/material.dart';
import 'package:project/pages/filldetails.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/noti_page.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  void _navigateBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotiificationPage()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FillDetails()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProfilePage(username: 'username')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed, 
      currentIndex: _selectedIndex,
      onTap: _navigateBottombar,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      showSelectedLabels: false, 
      showUnselectedLabels: false,
    
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          label: 'Notification',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: 'Add',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          label: 'Profile',
        ),
      ],
    );
  }
}
