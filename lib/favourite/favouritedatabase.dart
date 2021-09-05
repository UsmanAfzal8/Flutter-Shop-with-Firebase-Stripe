import 'package:flutter/cupertino.dart';

class favItems with ChangeNotifier {
  final String id;
  final String title;
  final String imageurl;
  final int price;

  favItems({
    required this.id,
    required this.title,
    required this.imageurl,
    required this.price,
  });
}
