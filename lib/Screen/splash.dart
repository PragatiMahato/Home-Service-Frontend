// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp/Screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
              )),
          Center(
            child: Container(
                margin: const EdgeInsets.only(
                  top: 170,
                ),
                child: const Text(
                  "Home Care",
                  style: TextStyle(
                      fontSize: 27,
                      color: Color(0XFF5C519A),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                )),
          )
        ],
      ),
    );
  }
}
