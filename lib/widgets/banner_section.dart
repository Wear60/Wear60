import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: const Color(0xFFD9D9D9),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/3974be7f9c7a08137f495ba5fa591ad65cb7ee0ee1edb539cfcde6fc1402bac9?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}