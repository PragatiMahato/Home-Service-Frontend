import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../CustomWidget/button.dart';
import 'login.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";

  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: AppSize.getScreenWidth(context),
      height: AppSize.getScreenHeight(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: CustomClipperAppBar(),
              child: Container(
                width: double.infinity,
                height: AppSize.getScreenHeight(context) * 0.47,
                decoration: ShapeDecoration(
                  color: const Color(0XFF5C519A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 80, top: 50),
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo.png"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 40),
              width: double.infinity,
              height: AppSize.getScreenHeight(context) * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Flexible(
                    child: Text(
                      "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  RoundedButton(
                    title: "Login",
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => (const LoginScreen())));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundedButton(
                    title: "Create an account",
                    callback: () {},
                    bgcolor: const Color(0XFF5C519A),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
