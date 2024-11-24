import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/order_screen.dart';
class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconUrl;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Orders') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrdersScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 19),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (iconUrl == 'order')
                  SvgPicture.asset(
                    'assets/order_icon.svg',
                    width: 27,
                    height: 27,
                  )
                else if (iconUrl == 'coupon')
                  SvgPicture.asset(
                    'assets/coupon_icon.svg',
                    width: 27,
                    height: 27,
                  ),
                const SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF626262),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF626262),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/01eaac8752def97fd7a73d97d3fd3f50efd79ec8f3ac16b1ff91f2f89f5476ae?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
              width: 15,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}