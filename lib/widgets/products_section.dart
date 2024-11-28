import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of product images to cycle through
    final productImages = [
      'assets/prod1.png',
      'assets/prod2.png',
      'assets/prod3.png',
      'assets/prod4.png',
    ];

    // Example stock availability, you can adjust based on your logic
    final List<bool> stockAvailability = [
      true,  // In stock
      false, // Out of stock
      true,  // In stock
      true,  // In stock
      false, // Out of stock
      true,  // In stock
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products for you',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: 6, // Total number of products
            itemBuilder: (context, index) => ProductCard(
              image: productImages[index % productImages.length], // Cycle through images
              company: 'Company Name',
              name: 'Name of the product will go here',
              price: '₹1200',
              isInStock: stockAvailability[index], // Pass the stock availability
            ),
          ),
        ],
      ),
    );
  }
}
