import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String label;

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (exception, stackTrace) {
            // Handle image loading error
            print('Error loading image: $exception');
          },
        ),
        const SizedBox(height: 7),
        Container(
          constraints: const BoxConstraints(maxHeight: 40), // Set a maximum height for the text container
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF626262),
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center, // Center the text
            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
            maxLines: 2, // Limit the text to 2 lines
          ),
        ),
      ],
    );
  }
}
