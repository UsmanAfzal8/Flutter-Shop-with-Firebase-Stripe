import 'package:flutter/cupertino.dart';
import 'package:fluttershop/sales/salesdatabase.dart';

class Products with ChangeNotifier {
  List<saleProduct> _product = [
    saleProduct(50, "assets/watch.png", "Samsung Watch", 1000, 500),
    saleProduct(60, "assets/cloth.png", "Apple Watch", 600, 300),
  ];
  List get products {
    return [..._product];
  }
}
