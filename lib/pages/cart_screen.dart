import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.only(bottom: 92),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                title: Row(
                  children: [
                    Image.asset(
                      'assets/shoppingbag.png',
                      width: 18,
                      height: 20,
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      'Shopping Bag',
                      style: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const CartItemWidget(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/56447edcdd7cba643dcaeeae7bb3017a3e07f8f0a517006c84e740de597c4d67?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
                title: 'Sage Green Mini Dress',
                price: 1200,
                isInStock: true,
              ),
              const CartItemWidget(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/21d146795c5c456488dddd8cf2e47926ff6e3ad74f208574d9f8dc90af816719?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
                title: 'Sage Green Mini Dress',
                price: 1200,
                isInStock: true,
              ),
              const PromoCodeInput(),
              const CheckoutSummary(
                subtotal: 2400,
                discount: 480,
                delivery: 30,
                tax: 25.99,
                total: 1975.99,
              ),
              const CheckoutButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final bool isInStock;

  const CartItemWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.isInStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x1A000000), width: 2),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imageUrl,
              width: 110,
              height: 129,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '₹FP',
                      style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF626262),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    Text(
                      '₹$price',
                      style: TextStyle(
                        color: Color(0xFF969696),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Color(0xFF969696),
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      'In Stock',
                      style: TextStyle(
                        color: Color(0xFF1D9E03),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuantitySelector(),
                    _buildSizeSelector(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/delete.png',
                        width: 14,
                        height: 14,
                      ),
                      label: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

  Widget _buildQuantitySelector() {
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
          child: Row(
            children: [
              const Text(
                '1',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 13),
              const Text(
                '+',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Row(
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
          child: Row(
            children: [
              const Text(
                'S',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
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

class PromoCodeInput extends StatefulWidget {
  const PromoCodeInput({Key? key}) : super(key: key);

  @override
  _PromoCodeInputState createState() => _PromoCodeInputState();
}

class _PromoCodeInputState extends State<PromoCodeInput> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _applyPromoCode() {
    _confettiController.play();
    // Add your logic to apply the promo code here
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Promocode',
                    hintStyle: TextStyle(
                      color: Color(0xE6969696),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 13,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7B846),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0x1A000000),
                    width: 2,
                  ),
                ),
                child: TextButton(
                  onPressed: _applyPromoCode,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10, // Reduced horizontal padding
                      vertical: 10, // Reduced vertical padding
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckoutSummary extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double delivery;
  final double tax;
  final double total;

  const CheckoutSummary({
    Key? key,
    required this.subtotal,
    required this.discount,
    required this.delivery,
    required this.tax,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x1A000000),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Subtotal', '₹$subtotal'),
          _buildSummaryRow('Discount', '₹$discount'),
          _buildSummaryRow('Delivery', '₹$delivery'),
          _buildSummaryRow('Tax', '₹$tax'),
          const Divider(),
          _buildSummaryRow('Total', '₹$total'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3D3D3D),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3D3D3D),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutButtons extends StatelessWidget {
  const CheckoutButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFFF7B846)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}