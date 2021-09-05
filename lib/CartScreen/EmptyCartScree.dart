import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.only(top: 100.0, left: 50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/emptycart.png'), fit: BoxFit.cover),
          ),
        ),
        Text(
          'Your Cart is Empty',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/feedScreen');
          },
          child: Text('Shop Now'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ],
    );
  }
}
