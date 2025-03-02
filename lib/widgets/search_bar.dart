import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/search_provider.dart';
import 'package:mal/screens/search_results_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextField(
        onSubmitted: (String query) {
          Provider.of<SearchProvider>(context, listen: false)
              .updateQuery(query);
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SearchResultsScreen()));
        },
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
            border: InputBorder.none),
      ),
    );
  }
}
