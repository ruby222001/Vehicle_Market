import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/profile_page.dart';

class BottomNavigator extends StatefulWidget {
   const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex =0;

   void _navigateBottombar(int index){
    setState(() {
      _selectedIndex=index;
    });
    
   }


final List _pages =[
HomePage(),
const ProfilePage(),
];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      currentIndex: _selectedIndex,
      onTap: _navigateBottombar,
      items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        color: Colors.white,
        ),
      label:'home',
      
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        color: Colors.white,
        ),
      label:'home',
      
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        color: Colors.white,
        ),
      label:'home',
      
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        color: Colors.white,
        ),
      label:'home',
      
      ),
      ]
    );
  }
}