import 'package:flutter/material.dart';
import 'category_item.dart';
import 'top_bar.dart';
import 'banner_section.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(),
            const BannerSection(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shop by Category',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3D3D3D),
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Wrap the GridView in a ConstrainedBox with scroll support
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 400, // Set a max height for the GridView
                    ),
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        CategoryItem(
                          image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/cfcef179de5b52367196bf656e40c79cbf8ffbf318485bec125c158e02aacd0b?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                          label: 'Women',
                        ),
                        CategoryItem(
                          image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/577c350c5bd83c4fd5d7b5fe688723003264295ce8d4cbc6b6ed1fc54a2b96bc?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                          label: 'Men',
                        ),
                        CategoryItem(
                          image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/689c019dc1e11629f7e159355935dc8ad278e402d2266872ee8b2e97d5213d6b?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                          label: 'Teens',
                        ),
                        CategoryItem(
                          image: 'https://cdn.builder.io/api/v1/image/assets/TEMP/daf16f1ffeec602c194f070f820e04a021dd9b24af07aed2312ff43dce058214?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
                          label: 'Kids',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
