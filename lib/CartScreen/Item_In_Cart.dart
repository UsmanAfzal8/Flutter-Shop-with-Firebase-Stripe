import 'package:flutter/material.dart';
import 'package:fluttershop/CartScreen/cartScreendatabase.dart';
import 'package:fluttershop/provider/cartprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemInCart extends StatefulWidget {
  // final String id;
  // final String title;
  // final String imageurl;
  // final int price;
  // final int quantity;

  // const ItemInCart(
  //     {required this.id,
  //     required this.title,
  //     required this.imageurl,
  //     required this.price,
  //     required this.quantity});

  @override
  _ItemInCartState createState() => _ItemInCartState();
}

class _ItemInCartState extends State<ItemInCart> {
  @override
  Widget build(BuildContext context) {
    final cartattribute = Provider.of<cartItems>(context);
    final cartproviderScreen = Provider.of<cartprovider>(context);
    int price = cartattribute.price * cartattribute.quantity;
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8.0, right: 8.0),
      child: Stack(
        children: [
          Container(
            height: 102,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        height: 102,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 90,
                          width: 50,
                          child: Image(
                            image: AssetImage(cartattribute.imageurl),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartattribute.title,
                          style: GoogleFonts.robotoSlab(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$ ' + price.toString(),
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: cartattribute.quantity < 2
                                  ? null
                                  : () {
                                      cartproviderScreen.removeProductToCart(
                                          cartattribute.id,
                                          cartattribute.price,
                                          cartattribute.title,
                                          cartattribute.imageurl);
                                    },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: 15,
                              ),
                            ),
                            Text(
                              cartattribute.quantity.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cartproviderScreen.addProductToCart(
                                    cartattribute.id,
                                    cartattribute.price,
                                    cartattribute.title,
                                    cartattribute.imageurl);
                              },
                              icon: Icon(Icons.add_circle_outline, size: 15),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                cartproviderScreen.deleteItem(cartattribute.id);
                              },
                              icon: Icon(Icons.delete_outline, size: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
