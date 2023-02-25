import 'package:flutter/material.dart';

import '../Constant/colors.dart';


class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withAlpha(50)
      ),

      child: child
    );
  }
}


class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,  this.icon, required this.controller
  }) : super(key: key);

  final String hint;
   final IconData? icon;
   final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(icon?? Icons.lock, color: kPrimaryColor),
          border: InputBorder.none
        ),
      ));
  }
}




