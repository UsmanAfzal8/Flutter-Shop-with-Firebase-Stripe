import 'package:flutter/material.dart';
import 'package:fluttershop/CartScreen/cartScreendatabase.dart';
import 'package:fluttershop/feedsScreen/feeddatabase.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class feedScreenExtend extends StatefulWidget {
  final String id;
  final String title;
  final String imageurl;
  final int price;
  final String decription;

  const feedScreenExtend(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.price,
      required this.decription});
  @override
  _feedScreenExtendState createState() => _feedScreenExtendState();
}

class _feedScreenExtendState extends State<feedScreenExtend> {
  @override
  Widget build(BuildContext context) {
    //feedScreendatabase feedattribute = Provider.of<feedScreendatabase>(context);
    final favproviderScreens = Provider.of<favprovider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/productdetail', arguments: widget.id);
        },
        child: Container(
          height: 180,
          width: 170,
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
                  width: 170,
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
                      image: AssetImage(widget.imageurl),
                    ),
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    height: 30,
                    width: 40,
                    child: IconButton(
                        onPressed: () {
                          favproviderScreens.addProductToCart(widget.id,
                              widget.price, widget.title, widget.imageurl);
                        },
                        icon: favproviderScreens.favitem.containsKey(widget.id)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.black,
                              )),
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
                  widget.title,
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
                  widget.decription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.quicksand(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3, right: 8),
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
                      '\$' + widget.price.toString(),
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
  }
}
