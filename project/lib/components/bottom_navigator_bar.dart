
import 'package:flutter/material.dart';
import 'package:project/pages/filldetails.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/noti_page.dart';
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
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
     if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotiificationPage()),
      );
     }
      if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  FillDetails()),
      );
    }
     if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
   
    
  
  }
   




  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      
      currentIndex: _selectedIndex,
      onTap: _navigateBottombar,
      type: BottomNavigationBarType.fixed,
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
          Icons.notifications,
        color: Colors.white,
        ),
      label:'Notification',
      
      ),
        BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
        color: Colors.white,
        ),
      label:'add',
      
      ),
      
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        color: Colors.white,
        ),
      label:'profile',
      
      ),
      ]
    );
  }
}