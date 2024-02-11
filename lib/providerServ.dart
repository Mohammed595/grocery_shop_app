import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/card_model.dart';

class ProviderServ with ChangeNotifier {
  final List<CardModel> _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    CardModel("Avocado", "4.00", "images/avocado.png", Colors.green),
    CardModel("Banana", "2.50", "images/banana.png", Colors.yellow),
    CardModel("Chicken", "12.80", "images/chicken.png", Colors.brown),
    CardModel("Water", "1.00", "images/water.png", Colors.blue),
  ];

  List get shopItem => _shopItems;

  List _cartItems = [];

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i].price); // Convert price to double
    }
    return totalPrice;
  }
}
