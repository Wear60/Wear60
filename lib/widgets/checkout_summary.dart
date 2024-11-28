import 'package:flutter/material.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Divider(color: Color(0x1A000000)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLeftColumn(),
              _buildRightColumn(),
            ],
          ),
          const Divider(color: Color(0x1A000000)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF626262),
                ),
              ),
              const Text(
                '₹1975.99',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF626262),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Subtotal',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF626262),
          ),
        ),
        SizedBox(height: 17),
        Text(
          'Discount',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
        SizedBox(height: 17),
        Text(
          'Delivery',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
        SizedBox(height: 17),
        Text(
          'Tax',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          '₹2400',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF626262),
          ),
        ),
        SizedBox(height: 17),
        Text(
          '-480',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
        SizedBox(height: 17),
        Text(
          '+30',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
        SizedBox(height: 17),
        Text(
          '+25.99',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF969696),
          ),
        ),
      ],
    );
  }
}