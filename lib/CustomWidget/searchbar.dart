import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Screen/search.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: const InputDecoration(
          hintText: "What are you looking for?",
          hintStyle: TextStyle(color: kPrimaryColor),
          prefixIcon: Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 33,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none),
      onSubmitted: (String) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SearchPage();
        }));
      },
    );
  }
}
