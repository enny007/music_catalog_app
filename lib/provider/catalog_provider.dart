import 'package:flutter/cupertino.dart';
import 'package:simple_provider_1/model/catalogmodel.dart';

import '../model/catalog.dart';

class CatalogProv with ChangeNotifier {
  CategoryItems categories = CategoryItems();
  final List<CatalogModel> _cartItems = [];

  List<CatalogModel> get cartItems => _cartItems;
  // List<CatalogModel> getselectedItems() {
  //   return _cartItems;
  // }

  void addToCart(CatalogModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CatalogModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    for (var item in _cartItems) {
      cartTotal += item.price!;
    }
    return cartTotal;
  }

  bool isItemInCart(CatalogModel item) {
    return _cartItems.any((e) => e.name == item.name);
  }
}
