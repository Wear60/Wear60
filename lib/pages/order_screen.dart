import 'package:flutter/material.dart';
import '../widgets/order_card.dart';
import '../models/order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: const Text(
                  '11:11',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/b5a98d59e9667635125575a2901de6b1b7980738109b000606eb8492e1810f82?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                width: 77,
                height: 49,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 25),
              const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3D3D3D),
                ),
              ),
              const SizedBox(height: 17),
              const OrderCard(
                order: Order(
                  image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/02e533828b0277305e205f34300dd180360e5b52168c9ec3cc795bdc60aea051?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                  status: 'Arriving in 15mins',
                  statusColor: Color(0xFFD35400),
                  description: 'Black cotton crew neck Hoddie with a subtle texture',
                ),
              ),
              const SizedBox(height: 14),
              const OrderCard(
                order: Order(
                  image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/cc1057c8280e25cf25a38dec88c9e6d5d73f72ff37caa1813355332a9b3af98f?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                  status: 'Delivered',
                  statusColor: Color(0xFF626262),
                  description: 'Black baseball cap with a flat brim.',
                ),
              ),
              const SizedBox(height: 14),
              const OrderCard(
                order: Order(
                  image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/f00a5099b1db00619058ed61d6d74920deb49c723a97fa5e67b17dc3ffc9d75f?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                  status: 'Delivered',
                  statusColor: Color(0xFF626262),
                  description: 'Grey shades by John Jacobs',
                ),
              ),
              const Spacer(),
              Container(
                width: 274,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}