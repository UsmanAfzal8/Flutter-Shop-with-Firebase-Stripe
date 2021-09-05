import 'package:flutter/material.dart';
import 'package:fluttershop/BottomNavigation.dart';
import 'package:fluttershop/provider/cartprovider.dart';
import 'package:fluttershop/provider/favourite.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class productdetail extends StatelessWidget {
  const productdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context, listen: false);
    String ExtendPage = ModalRoute.of(context)!.settings.arguments as String;
    final cartproviderScreen = Provider.of<cartprovider>(context);
    final favproviderScreen = Provider.of<favprovider>(context);
    List ExtendList = feederprovider.findByID(ExtendPage);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 30,
              width: 40,
              child: IconButton(
                  onPressed: () {
                    favproviderScreen.addProductToCart(
                        ExtendList[0].id,
                        ExtendList[0].price,
                        ExtendList[0].name,
                        ExtendList[0].imageurl);
                  },
                  icon: favproviderScreen.favitem.containsKey(ExtendList[0].id)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.black,
                        )),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 260,
                      width: double.infinity,
                      color: Colors.transparent,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width * 0.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Image(
                        image: AssetImage(ExtendList[0].imageurl),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ExtendList[0].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.bebasNeue(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Price ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$' + ExtendList[0].price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ExtendList[0].Decription,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.quicksand(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$' + ExtendList[0].price.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                        onPressed: cartproviderScreen.cartitem
                                .containsKey(ExtendList[0].id)
                            ? null
                            : () {
                                cartproviderScreen.addProductToCart(
                                    ExtendList[0].id,
                                    ExtendList[0].price,
                                    ExtendList[0].name,
                                    ExtendList[0].imageurl);
                              },
                        icon: cartproviderScreen.cartitem
                                .containsKey(ExtendList[0].id)
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 29,
                              )
                            : Icon(
                                Icons.card_travel,
                                color: Colors.black,
                              )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
