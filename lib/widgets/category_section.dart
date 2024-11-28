import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shop by Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CategoryItem(
                  image: 'assets/women.png',
                  label: 'Women',
                ),
                SizedBox(width: 20),
                CategoryItem(
                  image: 'assets/men.png',
                  label: 'Men',
                ),
                SizedBox(width: 20),
                CategoryItem(
                  image: 'assets/teen.png',
                  label: 'Teens',
                ),
                SizedBox(width: 20),
                CategoryItem(
                  image: 'assets/kids.png',
                  label: 'Kids',
                ),
                SizedBox(width: 20),
                CategoryItem(
                  image: 'assets/baby.png',
                  label: 'Babies',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}