import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:fluttershop/favourite/emptyfav.dart';
import 'package:fluttershop/favourite/favouritedatabase.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ExtendScreen/specificItemsShow.dart';
import 'FlashSaleTime/countdown_timer_page.dart';

class Searchscreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    final favproviderScreen = Provider.of<favprovider>(context);
    Map<String, favItems> favlist = favproviderScreen.favitem;
    List product = [];
    return favlist.isEmpty
        ? Scaffold(
            body: Emptyfav(),
          )
        : Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              title: Text(
                'Your Favourite ',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: GridView.count(
              childAspectRatio: 200 / 250,
              //crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              children: List.generate(favlist.length, (index) {
                return ChangeNotifierProvider.value(
                    value: favproviderScreen.favitem.values.toList()[index],
                    child: specificItems());
              }),
            ),
          );
  }
}
