import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String displayName;
  final String email;
  final String photoURL;

  const ProfileHeader({
    Key? key,
    required this.displayName,
    required this.email,
    required this.photoURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Image.network(
          //   'https://cdn.builder.io/api/v1/image/assets/TEMP/b5a98d59e9667635125575a2901de6b1b7980738109b000606eb8492e1810f82?placeholderIfAbsent=true&apiKey=303f4e9c2e3548e9bc5a09fc673fa272',
          //   width: 50,
          //   height: 50,
          //   fit: BoxFit.contain,
          // ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              photoURL,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error); // Fallback icon if image fails to load
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            displayName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            email,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}