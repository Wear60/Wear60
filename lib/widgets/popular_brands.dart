import 'package:flutter/material.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Search Brands',
          style: TextStyle(
            color: Color(0xFF3D3D3D),
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 23),
        Image.network(
          'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/b07b3982cb18039e7e8f1e3656ac3adaa549940452753273b4e97027e1af2a6a?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}