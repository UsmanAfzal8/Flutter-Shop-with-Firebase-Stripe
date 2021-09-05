import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/SearchScreen/searchscree.dart';
import 'package:fluttershop/feedscreen.dart';
import 'package:fluttershop/loginsignupscreen/googlesign.dart';
import 'package:fluttershop/loginsignupscreen/user_state.dart';
import 'package:fluttershop/provider/cartprovider.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:fluttershop/provider/product.dart';
import 'package:provider/provider.dart';

import 'BottomNavigation.dart';
import 'ExtendScreen/ExtendProductScreen.dart';
import 'feedsScreen/categoryfeedScreen.dart';
import 'homeScreen/topviewedfullScreen.dart';
import 'loginsignupscreen/loginScreen.dart';
import 'loginsignupscreen/signupscree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Products(),
      ),
      ChangeNotifierProvider(
        create: (context) => feedProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => cartprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => favprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Googlesignin(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userstate(),
      routes: {
        '/Loginscreen': (context) => loginScreenui(),
        '/BottomBar': (context) => BottomBar(),
        '/signupScreen': (context) => signupScreen(),
        '/productdetail': (context) => productdetail(),
        '/feedScreen': (context) => feedscreen(),
        '/CategoryfeedScreen': (context) => CategoryfeedScreen(),
        '/topviewedfeedScreen': (context) => topviewedfeedScreen(),
        '/SearchScreen': (context) => SearchScreen(),
      },
    );
  }
}
