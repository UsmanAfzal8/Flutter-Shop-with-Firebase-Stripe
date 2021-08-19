import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'FlashSaleTime/countdown_timer_page.dart';

class Searchscreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CountdownTimerPage(),
    );
  }
}
