import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Screen/profile.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
      },
      child: const TextField(
        decoration: InputDecoration(
            hintText: "What are you looking for?",
            hintStyle: TextStyle(color: kPrimaryColor),
            prefixIcon: Icon(
              Icons.search,
              color: kPrimaryColor,
              size: 33,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
