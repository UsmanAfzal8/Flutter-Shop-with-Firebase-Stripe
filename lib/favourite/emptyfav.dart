import 'package:flutter/material.dart';

class Emptyfav extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.only(top: 100.0, left: 50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/favorite.png'), fit: BoxFit.cover),
          ),
        ),
        Text(
          'Your Favourite is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
