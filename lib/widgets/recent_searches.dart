import 'package:flutter/material.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Searches',
          style: TextStyle(
            color: Color(0xFF3D3D3D),
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _buildRecentItem('', 'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/135fbde3a109f9bdaa4dae37c4090e688c9f540faee5a59843d324a230d2c243?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&'),
            const SizedBox(width: 9),
            _buildRecentItem('Jeans', 'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/159843a246eb3d6c47c88a9766d767a4547ac8b5991b2b0dfb8c68318454f4e5?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&'),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentItem(String label, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF626262),
            fontSize: 11,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}