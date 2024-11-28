import 'package:flutter/material.dart';
import '../models/cart_item.dart'; // Import your CartItem model

class CartItemWidget extends StatelessWidget {
  final CartItem item; // Expecting a CartItem object

  const CartItemWidget({
    Key? key,
    required this.item, // Pass CartItem object here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x1A000000)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              item.image, // Accessing image from CartItem
              width: 110,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title, // Accessing title from CartItem
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF626262),
                      ),
                    ),
                    const Text(
                      '₹FP',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3D3D3D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    Text(
                      '₹${item.price}', // Accessing price from CartItem
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF969696),
                      ),
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      '|',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF969696),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      item.isInStock ? 'In Stock' : 'Out of Stock',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: item.isInStock
                            ? const Color(0xFF1D9E03)
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    const Expanded(
                      child: QuantitySelector(),
                    ),
                    const SizedBox(width: 33),
                    const Expanded(
                      child: SizeSelector(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Qty:',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF626262),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x33000000)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '1',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 13),
              Text(
                '+',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SizeSelector extends StatelessWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Size:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF626262),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x33000000)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'S',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '+',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            size: 14,
            color: Color(0xFF626262),
          ),
          label: const Text(
            'Delete',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF626262),
            ),
          ),
        ),
      ],
    );
  }
}
