import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavitationWidget extends StatelessWidget {
  var _currenIndexBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currenIndexBottomNavigation,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("asd")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("asd")),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("asd")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("asd")),
        ],
        onTap: (index) {
          _currenIndexBottomNavigation = index;
        });
  }
}
