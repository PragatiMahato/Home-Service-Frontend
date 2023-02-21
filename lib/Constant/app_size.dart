import 'package:flutter/material.dart';

class AppSize {

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static const double s10 = 10;
  static const double s20 = 20;
  static const double s30 = 30;
  static const EdgeInsets globalSymetricpadding =
      EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  static const EdgeInsets globalSymetricmargin =
      EdgeInsets.symmetric(horizontal: 30);
}
