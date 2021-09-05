import 'package:flutter/material.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:fluttershop/homeScreen/feedScreenextend.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryfeedScreen extends StatefulWidget {
  const CategoryfeedScreen({Key? key}) : super(key: key);

  @override
  _CategoryfeedScreenState createState() => _CategoryfeedScreenState();
}

class _CategoryfeedScreenState extends State<CategoryfeedScreen> {
  @override
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context, listen: false);
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    List feederlist;
    if (categoryName == 'All') {
      print('All');
      feederlist = feederprovider.FeedScreenprovider;
    } else {
      feederlist = feederprovider.findByCategory(categoryName);
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      // body: StaggeredGridView.countBuilder(
      //   crossAxisCount: 6,
      //   itemCount: 12,
      //   itemBuilder: (BuildContext context, int index) => feedScreen(),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(3, index.isEven ? 4 : 5),
      //   mainAxisSpacing: 8.0,
      //   crossAxisSpacing: 6.0,
      // ),
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
