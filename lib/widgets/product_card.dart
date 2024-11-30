import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../providers/cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

final supabase = Supabase.instance.client;
firebase.User? fbUser = firebase.FirebaseAuth.instance.currentUser;


class ProductCard extends StatefulWidget {
  final String image;
  final String company;
  final String name;
  final String price;
  final bool isInStock;
  final String productId;

  const ProductCard({
    Key? key,
    required this.image,
    required this.company,
    required this.name,
    required this.price,
    required this.isInStock,
    required this.productId,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    _checkCartStatus();
  }

  Future<void> _checkCartStatus() async {
    final response = await supabase
        .from('cartitems')
        .select()
        .eq('product_id', widget.productId)
        .eq('customer_email', fbUser?.email ?? '');

    setState(() {
      isAddedToCart = (response as List).isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {

    setState(() {
      isAddedToCart = !isAddedToCart;
    });

    try {
      if (isAddedToCart) {
        // Insert into cartitems
        await Supabase.instance.client.from('cartitems').insert({
            'product_id': int.parse(widget.productId), 
          'customer_email': fbUser?.email ?? '',
          'quantity': 1,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.name} added to cart'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Remove from cartitems
        await Supabase.instance.client
            .from('cartitems')
            .delete()
            .eq('product_id', widget.productId)
            .eq('customer_email', fbUser?.email ?? '');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.name} removed from cart'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error processing cart: $e'),
          backgroundColor: Colors.red,
        ),
      );
      // Revert state if operation fails
      setState(() {
        isAddedToCart = !isAddedToCart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
            height: 170,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
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
          style: TextStyle(
              fontSize: 9,
              color: Colors.grey[600],
              fontWeight: FontWeight.w300),
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
