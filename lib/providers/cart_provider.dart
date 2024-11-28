import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  // A list of items in the cart, initialized as an empty list.
  List<String> _cartItems = [];

  // Getter to access the cart items.
  List<String> get cartItems => _cartItems;

  // Getter for the number of items in the cart.
  int get itemCount => _cartItems.length;

  // Method to add an item to the cart.
  void addItem(String item) {
    _cartItems.add(item);
    notifyListeners();  // Notify listeners that the cart has changed.
  }

  // Method to remove an item from the cart.
  void removeItem(String item) {
    _cartItems.remove(item);
    notifyListeners();  // Notify listeners that the cart has changed.
  }
}
