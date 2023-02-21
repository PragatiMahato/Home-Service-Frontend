import 'package:flutter/material.dart';

class SocialMedialIcon extends StatelessWidget {
  final String imgIcon;

  const SocialMedialIcon({super.key, required this.imgIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
          height: 28,
          width: 28,
          child: Image.asset(imgIcon)),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Align(
            alignment: Alignment.center,
            child: Text(
              "or Login with:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 61, 61, 61)),
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          padding: const EdgeInsets.only(top: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SocialMedialIcon(
                imgIcon: "assets/images/facebook.png",
              ),
              const SizedBox(
                width: 20,
              ),
              const SocialMedialIcon(
                imgIcon: "assets/images/twitter.png",
              ),
              const SizedBox(
                width: 20,
              ),
              const SocialMedialIcon(
                imgIcon: "assets/images/google.png",
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
