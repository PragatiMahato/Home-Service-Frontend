import 'package:flutter/material.dart';

import '../Constant/app_colors.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
required this.callback, this.bgcolor, this.borderRadius, required this.title,
    
  }) : super(key: key);

  final String title;
   final VoidCallback callback;
     final Color? bgcolor;
     final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: callback,
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: bgcolor?? kPrimaryColor,
          borderRadius: BorderRadius.circular(borderRadius?? 35),
        ),

        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.animationController,
    required this.tapEvent
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final AnimationController? animationController;
  final GestureTapCallback? tapEvent;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width,
          height: size.height * 0.1,
          alignment: Alignment.bottomCenter,

          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: tapEvent,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}