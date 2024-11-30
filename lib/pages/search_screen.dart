import 'package:flutter/material.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/recent_searches.dart';
import '../widgets/popular_brands.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  List<String> _filteredItems = [];
  final List<String> _allItems = [
    'Tops',
    'Jeans',
    'Shoes',
    'Dresses',
    'Jackets',
    'Accessories',
    'Bags',
    'Hats',
    'Socks',
    'Belts',
  ];

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
      _filteredItems = _allItems
          .where((item) => item.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFAFAFA),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 72, 20, 46),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                custom.SearchBar(onSearch: _handleSearch),
                const SizedBox(height: 24),
                RecentSearches(),
                const SizedBox(height: 32),
                PopularBrands(),
                const SizedBox(height: 32),
                const Text(
                  'Search Results',
                  style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index]),
                      );
                    },
                  ),
                ),
                const Spacer(),
                const HomeIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeIndicator extends StatelessWidget {
  const HomeIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 274,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}