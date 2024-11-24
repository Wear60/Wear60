import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              order.image,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.status,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: order.statusColor,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  order.description,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF626262),
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/01eaac8752def97fd7a73d97d3fd3f50efd79ec8f3ac16b1ff91f2f89f5476ae?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
            width: 15,
            height: 15,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}