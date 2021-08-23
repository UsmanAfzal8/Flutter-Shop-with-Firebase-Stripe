import 'package:flutter/material.dart';
import 'package:fluttershop/const/Icon.dart';
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
    List feederlist = feederprovider.findByCategory(categoryName);
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
        childAspectRatio: 200 / 250,
        //crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: List.generate(feederlist.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/productdetail',
                    arguments: feederlist[index].id);
              },
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xf063970),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 130,
                          width: 50,
                          child: Image(
                            image: AssetImage(feederlist[index].imageurl),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.favorite_border_rounded),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Text(
                        feederlist[index].name,
                        maxLines: 1,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$' + feederlist[index].price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(MyIcon.Cart))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
