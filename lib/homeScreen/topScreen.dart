import 'package:flutter/material.dart';
import 'package:fluttershop/homeScreen/feedScreenextend.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context);
    List feedattribute = feederprovider.FeedScreenprovider;
    List topViewed = feederprovider.TopViewed;
    return Container(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        itemCount: topViewed.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return feedScreenExtend(
            id: topViewed[index].id,
            imageurl: topViewed[index].imageurl,
            title: topViewed[index].name,
            decription: topViewed[index].Decription,
            price: topViewed[index].price,
          );
        },
      ),
    );
  }
}
