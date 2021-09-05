import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershop/provider/cartprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'CartScreen/EmptyCartScree.dart';
import 'CartScreen/Item_In_Cart.dart';

class Cartscreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final cartproviderScreen = Provider.of<cartprovider>(context);
    return cartproviderScreen.cartitem.isEmpty
        ? Scaffold(body: EmptyScreen())
        : Scaffold(
            bottomSheet: checkoutSection(
                context,
                cartproviderScreen.cartitem.length,
                cartproviderScreen.TotalAmout),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'My Cart',
                style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: Container(
              //height: 140,
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartproviderScreen.cartitem.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                      value: cartproviderScreen.cartitem.values.toList()[index],
                      child: ItemInCart(
                          // id: cartproviderScreen.cartitem.values.toList()[index].id,
                          // imageurl: cartproviderScreen.cartitem.values
                          //     .toList()[index]
                          //     .imageurl,
                          // price: cartproviderScreen.cartitem.values
                          //     .toList()[index]
                          //     .price,
                          // quantity: cartproviderScreen.cartitem.values
                          //     .toList()[index]
                          //     .quantity,
                          // title: cartproviderScreen.cartitem.values
                          //     .toList()[index]
                          //     .title,
                          ),
                    );
                  }),
            ),
          );
  }

  Widget checkoutSection(BuildContext ctx, int length, int totalAmout) {
    //int  cartproviderScreen;
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.orange.withOpacity(0.3),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            length.toString() + ' Items',
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            '\$' + totalAmout.toString(),
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(ctx).size.width,
            color: Colors.orange.withOpacity(0.3),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Proceed To Chechout',
                  style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.fast_forward_outlined))
              ],
            )),
          ),
        ],
      ),
    );
  }
}
