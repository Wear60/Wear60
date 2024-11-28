import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/b5a98d59e9667635125575a2901de6b1b7980738109b000606eb8492e1810f82?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
            width: 77,
            fit: BoxFit.contain,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFE2E2E2),
                width: 2,
              ),
            ),
            child: Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/dd1afe27ce48affdda1d59cf3d94e5a8ef2b4a6421b414eefffe93e51fdd0e66?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
              width: 21,
              height: 21,
              fit: BoxFit.contain,
            ),
          ),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/1311d1fc8c59f9a960b375828dfa3f6f62c6b5a0d46cd60bdc3addfabe9f412c?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
            width: 21,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}