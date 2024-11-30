import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/product_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<dynamic> data = snapshot.data as List<dynamic>;
          
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
                  itemCount: data.length,
                  itemBuilder: (context, index) => ProductCard(
                    image: data[index]['image'], // Pass the URL string directly
                    company: data[index]['companies']['name'],
                    name: data[index]['name'],
                    price: '₹${data[index]['price'].toStringAsFixed(0)}',
                    isInStock: true, productId: data[index]['id'].toString()
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<List<dynamic>> fetchData() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('products').select('name, price, image, companies (name),id');
    return data;
  }
}
