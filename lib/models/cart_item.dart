// lib/models/cart_item.dart

class CartItem {
  final String image;
  final String title;
  final String price;
  final bool isInStock; // Add isInStock property

  CartItem({
    required this.image,
    required this.title,
    required this.price,
    required this.isInStock, // Initialize isInStock in the constructor
  });
}
