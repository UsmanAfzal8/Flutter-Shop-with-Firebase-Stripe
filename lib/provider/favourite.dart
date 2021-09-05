import 'package:flutter/cupertino.dart';
import 'package:fluttershop/favourite/favouritedatabase.dart';

class favprovider with ChangeNotifier {
  Map<String, favItems> _favList = {};

  Map<String, favItems> get favitem {
    return _favList;
  }

  void addProductToCart(
      String productId, int price, String title, String imageurl) {
    if (_favList.containsKey(productId)) {
      deleteItem(productId);
    } else {
      _favList.putIfAbsent(
          productId,
          () => favItems(
              id: productId, title: title, price: price, imageurl: imageurl));
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    _favList.remove(id);
    notifyListeners();
  }
}
