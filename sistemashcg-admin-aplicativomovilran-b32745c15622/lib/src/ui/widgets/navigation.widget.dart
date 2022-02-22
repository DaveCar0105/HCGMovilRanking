import 'package:flutter/material.dart';

class NavitationWidget extends StatelessWidget {
  var _currenIndexBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currenIndexBottomNavigation,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "asd"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "asd"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "asd"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "asd"),
        ],
        onTap: (index) {
          _currenIndexBottomNavigation = index;
        });
  }
}
