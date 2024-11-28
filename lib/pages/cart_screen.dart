// lib/pages/cart_screen.dart

import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import '../widgets/checkout_summary.dart';
import '../widgets/promo_code_input.dart';
import '../models/cart_item.dart'; // Import the CartItem model

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample cart items with 'isInStock' property
    List<CartItem> cartItems = [
      CartItem(
        image: 'assets/dress1.png',
        title: 'Sage Green Mini Dress',
        price: '1200',
        isInStock: true,  // Item is in stock
      ),
      CartItem(
        image: 'assets/dress2.png',
        title: 'Blue Skirt',
        price: '800',
        isInStock: false,  // Item is out of stock
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.grey[100],
                title: const Text(
                  'Shopping Bag',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF626262),
                  ),
                ),
                leading: const Icon(Icons.shopping_bag_outlined),
              ),
              // Check if cart is empty, display a message if so
              cartItems.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : Column(
                      children: [
                        // Display cart items dynamically
                        for (var cartItem in cartItems)
                          CartItemWidget(item: cartItem),  // Pass CartItem object
                      ],
                    ),
              const PromoCodeInput(),
              const CheckoutSummary(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7B846),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFF7B846)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: Color(0xFF626262),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
