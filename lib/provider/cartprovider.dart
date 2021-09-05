import 'package:flutter/cupertino.dart';
import 'package:fluttershop/CartScreen/cartScreendatabase.dart';

class cartprovider with ChangeNotifier {
  Map<String, cartItems> _cartList = {};

  Map<String, cartItems> get cartitem {
    return _cartList;
  }

  int get TotalAmout {
    int total = 0;
    _cartList.forEach((Key, Value) {
      total += (Value.price * Value.quantity);
    });
    return total;
  }

  void addProductToCart(
      String productId, int price, String title, String imageurl) {
    if (_cartList.containsKey(productId)) {
      _cartList.update(
          productId,
          (exitingCartItem) => cartItems(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity + 1,
              imageurl: exitingCartItem.imageurl));
    } else {
      _cartList.putIfAbsent(
          productId,
          () => cartItems(
              id: productId,
              title: title,
              price: price,
              quantity: 1,
              imageurl: imageurl));
    }
    notifyListeners();
  }

  void removeProductToCart(
      String productId, int price, String title, String imageurl) {
    if (_cartList.containsKey(productId)) {
      _cartList.update(
          productId,
          (exitingCartItem) => cartItems(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity - 1,
              imageurl: exitingCartItem.imageurl));
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    _cartList.remove(id);
    notifyListeners();
  }
}
