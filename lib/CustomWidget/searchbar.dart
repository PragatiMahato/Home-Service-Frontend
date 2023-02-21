import 'package:flutter/material.dart';

import '../Constant/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Search",hintStyle: TextStyle(color: kPrimaryColor),
        suffixIcon: Icon(Icons.search,color: kPrimaryColor,size: 25,),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none
      ),
    );
  }
}
