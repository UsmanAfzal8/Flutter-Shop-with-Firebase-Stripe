import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/FlashSaleTime/countdown_timer_page.dart';
import 'package:fluttershop/homeScreen/topScreen.dart';

import 'Categrous.dart';
import 'Sales.dart';
import 'headerimage.dart';

class HomeScreenwidget extends StatefulWidget {
  const HomeScreenwidget({Key? key}) : super(key: key);

  @override
  _HomeScreenwidgetState createState() => _HomeScreenwidgetState();
}

class _HomeScreenwidgetState extends State<HomeScreenwidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'E Store',
              style: TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(16),
              padding: EdgeInsets.all(8),
            ),
          ),
          Headeriamge(),
          SizedBox(
            height: 10,
          ),
          category(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Flash Sale',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                Text(
                  'Closing in: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: 90,
                  height: 30,
                  child: Center(child: CountdownTimerPage()),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SalesItem(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Top Viewed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                Material(
                  child: InkWell(
                    // splashColor: Colors.red,
                    onTap: () {},
                    child: Text(
                      'View All...',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TopScreen(),
        ],
      ),
    );
  }
}
