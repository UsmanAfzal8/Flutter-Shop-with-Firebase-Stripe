import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/BottomNavigation.dart';
import 'package:fluttershop/loginsignupscreen/loginScreen.dart';

class userstate extends StatelessWidget {
  const userstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          // ignore: missing_return
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (userSnapshot.hasData) {
              print('The user is logged in');
              return BottomBar();
            } else if (userSnapshot.hasError) {
              return Center(
                child: Text('Something Wrong'),
              );
            } else {
              return loginScreenui();
            }
          }),
    );
  }
}
