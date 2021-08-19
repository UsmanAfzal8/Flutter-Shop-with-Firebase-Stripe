import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CartScreen/EmptyCartScree.dart';
import 'CartScreen/Item_In_Cart.dart';

class Cartscreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemInCart(),
    );
  }
}
