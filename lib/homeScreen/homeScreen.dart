import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershop/FlashSaleTime/countdown_timer_page.dart';
import 'package:fluttershop/homeScreen/topScreen.dart';
import 'package:fluttershop/sales/salesdatabase.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.grid_view,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/SearchScreen');
              },
              icon: Icon(
                Icons.search,
                size: 35,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/usman.jpg'),
                ),
                Positioned(
                  right: 0,
                  top: 1,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Headeriamge(),
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
              SizedBox(
                height: 10,
              ),
              category(),
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
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/topviewedfeedScreen');
                        },
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
        ),
      ),
    );
  }
}
