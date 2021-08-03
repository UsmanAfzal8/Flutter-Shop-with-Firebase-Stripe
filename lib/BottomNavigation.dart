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
  int _selectedIndex = 4;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.transparent,
        curve: Curves.ease,
        showElevation: false,
        selectedIndex: _selectedIndex,
        onItemSelected: _selectPage,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Home'), icon: Icon(MyIcon.home)),
          BottomNavyBarItem(title: Text('Feed'), icon: Icon(MyIcon.Feed)),
          BottomNavyBarItem(title: Text('Search'), icon: Icon(MyIcon.Search)),
          BottomNavyBarItem(title: Text('Cart'), icon: Icon(MyIcon.Cart)),
          BottomNavyBarItem(title: Text('User'), icon: Icon(MyIcon.User)),
        ],
      ),
    );
  }
}
