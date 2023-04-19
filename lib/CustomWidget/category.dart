import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../Constant/app_colors.dart';
import '../Screen/search.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.text,
    required this.press,
    this.buttonText,
  });
  final String text;
  final Callback? press;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(13)),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }));
                },
                child: Text(
                  buttonText!,
                  style: const TextStyle(
                      color: backgroundWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}
