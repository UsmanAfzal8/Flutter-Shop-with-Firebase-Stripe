import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershop/userscreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.transparent,
        curve: Curves.ease,
        showElevation: false,
        selectedIndex: _selectedIndex,
        onItemSelected: _selectPage,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('Feed'), icon: Icon(Icons.rss_feed)),
          BottomNavyBarItem(title: Text('Search'), icon: Icon(Icons.search)),
          BottomNavyBarItem(
              title: Text('Cart'), icon: Icon(Icons.shopping_basket)),
          BottomNavyBarItem(title: Text('User'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
