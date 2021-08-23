import 'package:flutter/material.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context);
    List topViewed = feederprovider.TopViewed;
    print(topViewed.length.toString());
    return Container(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        itemCount: topViewed.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/productdetail',
                    arguments: topViewed[index].id);
              },
              child: Container(
                height: 250,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(1, 0),
                        blurRadius: 4,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 150,
                    //   width: 200,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8.0),
                    //       color: Colors.orange.withOpacity(0.3),
                    //       image: DecorationImage(
                    //           fit: BoxFit.fitHeight,
                    //           image: AssetImage('assets/watch.png'))),
                    // ),
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
                            image: AssetImage(topViewed[index].imageurl),
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
                        topViewed[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Text(
                        topViewed[index].Decription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 3, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Price : ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$' + topViewed[index].price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
