import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String route='/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    print('search');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
  }
}
