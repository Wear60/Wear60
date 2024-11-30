import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E2E2), width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Color(0xFF626262)),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Color(0xFF626262),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              onChanged: (value) {
                // Handle search query change
                widget.onSearch(value);
              },
            ),
          ),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/303f4e9c2e3548e9bc5a09fc673fa272/dd1afe27ce48affdda1d59cf3d94e5a8ef2b4a6421b414eefffe93e51fdd0e66?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
            width: 21,
            height: 21,
          ),
        ],
      ),
    );
  }
}