import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:fluttershop/userscreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'Searchscreen.dart';
import 'cartscreen.dart';
import 'feedscreen.dart';
import 'homescreen.dart';

class BottomBar extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List _pages = [
    HomeScreen(),
    feedscreen(),
    Searchscreen(),
    Cartscreen(),
    Userscreen(),
  ];
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.transparent,
          curve: Curves.ease,
          showElevation: false,
          selectedIndex: _selectedIndex,
          onItemSelected: _selectPage,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(MyIcon.home),
                activeColor: Colors.orange.withOpacity(0.3),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                title: Text(
                  'All Items',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(MyIcon.Feed),
                activeColor: Colors.orange.withOpacity(0.3),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                title: Text(
                  'Favourite',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(Icons.favorite_border_rounded),
                activeColor: Colors.orange.withOpacity(0.3),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                title: Text(
                  'Cart',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(MyIcon.Cart),
                activeColor: Colors.orange.withOpacity(0.3),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                title: Text(
                  'User',
                  style: TextStyle(color: Colors.orange),
                ),
                icon: Icon(MyIcon.User),
                activeColor: Colors.orange.withOpacity(0.3),
                inactiveColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
