import 'package:flutter/material.dart';

import '../Constant/colors.dart';

class InputContainer extends StatefulWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kPrimaryColor.withAlpha(50)),
        child: widget.child);
  }
}

class RoundedPasswordInput extends StatefulWidget {
  const RoundedPasswordInput(
      {Key? key, required this.hint, this.icon, required this.controller})
      : super(key: key);

  final String hint;
  final IconData? icon;
  final TextEditingController controller;

  @override
  State<RoundedPasswordInput> createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
      bool passwordObsecured = true;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: widget.controller,
      cursorColor: kPrimaryColor,
      obscureText: passwordObsecured,
      decoration: InputDecoration(
          hintText: widget.hint,
           suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObsecured = !passwordObsecured;
                                });
                              },
                              icon: Icon(passwordObsecured
                                  ? Icons.visibility_off
                                  : Icons.visibility,color: kPrimaryColor,)),
          border: InputBorder.none),
    ));
  }
}

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key? key, required this.hint, this.icon, this.controller})
      : super(key: key);

  final String hint;
  final IconData? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(icon ?? Icons.email, color: kPrimaryColor),
          border: InputBorder.none),
    ));
  }
}
