import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'homeScreen/homeScreen.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeScreenwidget(),
      ),
    );
  }
}
