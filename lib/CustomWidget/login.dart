// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screen/foget_pw.dart';
import '../Screen/services.dart';
import 'button.dart';
import 'input_fielda.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailcontroller;
  late final TextEditingController _passwordcontroller;
  final _formkey = GlobalKey<FormState>();
  Future _logIn() async {
    const url = "http://localhost:3000/logIn";
    final email = _emailcontroller.text;
    final password = _passwordcontroller.text;
    final body = jsonEncode({
      'email': email,
      'password': password,
    });
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body)['user'];
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Success"),
                content: Text("Logged in as ${user['username']}"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Ok"))
                ],
              ));
    } else if (response.statusCode == 401) {
      final message = jsonDecode(response.body)['message'];
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Ok"))
                ],
              ));
    } else if (response.statusCode == 404) {
      final message = jsonDecode(response.body)['message'];
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Ok"))
                ],
              ));
    } else {
      final message = jsonDecode(response.body)['message'];
      print('Error occurred: $message');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Ok"))
          ],
        ),
      );
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27),
                ),
                const SizedBox(height: 40),
                Image.asset('assets/images/login.png'),
                const SizedBox(height: 70),
                RoundedInput(
                  hint: 'email',
                  controller: _emailcontroller,
                ),
                RoundedPasswordInput(
                  hint: 'Password',
                  controller: _passwordcontroller,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 165,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (const ChangePwScreen())));
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                const SizedBox(height: 15),
                RoundedButton(
                  title: 'LOGIN',
                  callback: () {
                    _logIn();
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                // const SocialIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
