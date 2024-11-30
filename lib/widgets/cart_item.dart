import 'package:flutter/material.dart';
import '../models/cart_item.dart'; // Import CartItem model

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged; // Callback to update quantity
  final VoidCallback onDelete; // Callback to delete item

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Quantity and Stock status
                  Row(
                    children: [
                      if (item.isInStock)
                        // Quantity Selector
                        Row(
                          children: [
                            IconButton(
                              onPressed: item.quantity > 1
                                  ? () {
                                      onQuantityChanged(item.quantity - 1);
                                    }
                                  : null,
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              item.quantity.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                onQuantityChanged(item.quantity + 1);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      if (!item.isInStock)
                        Text(
                          'Out of stock',
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            // Remove from Cart button
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
