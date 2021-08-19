import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'feedsScreen/feedscreen.dart';

class feedscreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feeds screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => feedScreen(),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(3, index.isEven ? 4 : 5),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      ),
      // body: GridView.count(
      //   childAspectRatio: 200 / 250,
      //   //crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   crossAxisCount: 2,
      //   children: List.generate(100, (index) {
      //     return feedScreen();
      //   }),
      // ),
    );
  }
}
