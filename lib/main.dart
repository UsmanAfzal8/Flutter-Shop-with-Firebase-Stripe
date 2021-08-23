import 'package:flutter/material.dart';
import 'package:fluttershop/feedscreen.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:fluttershop/provider/product.dart';
import 'package:provider/provider.dart';

import 'BottomNavigation.dart';
import 'ExtendScreen/ExtendProductScreen.dart';
import 'feedsScreen/categoryfeedScreen.dart';
import 'homeScreen/topviewedfullScreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Products(),
      ),
      ChangeNotifierProvider(
        create: (context) => feedProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
      routes: {
        '/productdetail': (context) => productdetail(),
        '/feedScreen': (context) => feedscreen(),
        '/CategoryfeedScreen': (context) => CategoryfeedScreen(),
        '/topviewedfeedScreen': (context) => topviewedfeedScreen(),
      },
    );
  }
}
