import 'package:flutter/material.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'feedScreenextend.dart';

class topviewedfeedScreen extends StatefulWidget {
  const topviewedfeedScreen({Key? key}) : super(key: key);

  @override
  _topviewedfeedScreenState createState() => _topviewedfeedScreenState();
}

class _topviewedfeedScreenState extends State<topviewedfeedScreen> {
  @override
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context);
    List feederlist = feederprovider.TopViewed;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Most Viewed ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GridView.count(
        childAspectRatio: 200 / 280,
        //crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: List.generate(feederlist.length, (index) {
          return feedScreenExtend(
            id: feederlist[index].id,
            imageurl: feederlist[index].imageurl,
            title: feederlist[index].name,
            decription: feederlist[index].Decription,
            price: feederlist[index].price,
          );
        }),
      ),
    );
  }
}
