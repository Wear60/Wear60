import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String company;
  final String name;
  final String price;
  final bool isInStock;  // Added the isInStock parameter

  const ProductCard({
    Key? key,
    required this.image,
    required this.company,
    required this.name,
    required this.price,
    required this.isInStock,  // Passed as a required argument
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isAddedToCart = false;

  // Toggle heart icon and add to cart
  void _toggleFavorite() {
    setState(() {
      isAddedToCart = !isAddedToCart;
    });

    // Add to cart if not added
    if (isAddedToCart) {
      final cartItem = CartItem(
        image: widget.image,
        title: widget.name,
        price: widget.price,
        isInStock: widget.isInStock,  // Pass the actual value of isInStock
      );
      Provider.of<CartProvider>(context, listen: false).addItem(cartItem as String);
    } else {
      final cartItem = CartItem(
        image: widget.image,
        title: widget.name,
        price: widget.price,
        isInStock: widget.isInStock,  // Make sure isInStock is passed here as well
      );
      Provider.of<CartProvider>(context, listen: false).removeItem(cartItem as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          widget.image,
          fit: BoxFit.cover,
          height: 170,
          width: double.infinity,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.company,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: _toggleFavorite,
              child: Image.asset(
                isAddedToCart ? 'assets/heart_filled.png' : 'assets/heart.png',
                width: 18,
                height: 18,
              ),
            ),
          ],
        ),
        Text(
          widget.name,
          style: TextStyle(fontSize: 9, color: Colors.grey[600], fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 4),
        Text(
          widget.price,
          style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
