import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class feedScreendatabase with ChangeNotifier {
  final String id;
  final String name;
  final String Decription;
  final String imageurl;
  final int price;
  final String productcategoryname;
  final int quantity;
  final bool isfavourite;
  final bool isPopular;
  final int off;

  feedScreendatabase(
      this.id,
      this.name,
      this.Decription,
      this.imageurl,
      this.price,
      this.productcategoryname,
      this.quantity,
      this.isfavourite,
      this.isPopular,
      this.off);
}
