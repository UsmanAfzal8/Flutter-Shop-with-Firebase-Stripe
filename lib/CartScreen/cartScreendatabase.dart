import 'package:flutter/cupertino.dart';

class cartItems with ChangeNotifier {
  final String id;
  final String title;
  final String imageurl;
  final int price;
  final int quantity;

  cartItems(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.price,
      required this.quantity});
}
