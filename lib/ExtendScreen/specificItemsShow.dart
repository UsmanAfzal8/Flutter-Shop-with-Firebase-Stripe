import 'package:flutter/material.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:fluttershop/favourite/favouritedatabase.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class specificItems extends StatelessWidget {
  const specificItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final favproviderScreen = Provider.of<favItems>(context);
    final favproviderScreens = Provider.of<favprovider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/productdetail', arguments: favproviderScreen.id);
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
                      image: AssetImage(favproviderScreen.imageurl),
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
                          favproviderScreens.addProductToCart(
                              favproviderScreen.id,
                              favproviderScreen.price,
                              favproviderScreen.title,
                              favproviderScreen.imageurl);
                        },
                        icon: favproviderScreens.favitem
                                .containsKey(favproviderScreen.id)
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
                  favproviderScreen.title,
                  maxLines: 1,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$' + favproviderScreen.price.toString(),
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
  }
}
