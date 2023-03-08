// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'button.dart';
import 'input_fielda.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();

  void _signUp() async {
    const url = "http://192.168.1.9:3000/signUp";
    final email = _emailcontroller.text;
    final password = _passwordcontroller.text;

    final body = jsonEncode({'email': email, 'password': password});

    final resposne = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    print(resposne.body);
    if (resposne.statusCode == 201) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("success"),
              content: const Text("your account has been created"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          });
    } else if (resposne.statusCode == 409) {
      final message = jsonDecode(resposne.body)['message'];
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("error"),
              content: const Text("Error occured"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          });
    }
  }

  // Future save() async {
  //   var res = await http.post("http://localhost:3000//signUp" as Uri,
  //       headers: <String, String>{
  //         'Context-Type': 'application/json;charSet=UTF-8'
  //       },
  //       body: <String, String>{
  //         'email': user.email,
  //         'password': user.password
  //       });
  //   debugPrint(res.body);
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // }

  // Usermodel user = Usermodel(email: '', password: '');

  late final TextEditingController _emailcontroller;
  late final TextEditingController _passwordcontroller;
  late final TextEditingController _usernamecontroller;
  late final TextEditingController _callcontroller;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _usernamecontroller = TextEditingController();
    _callcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 40),
                    Image.asset('assets/images/login.png'),
                    const SizedBox(height: 40),
                    RoundedInput(
                      hint: 'Username',
                      icon: Icons.person,
                      controller: _usernamecontroller,
                    ),
                    RoundedInput(
                      hint: 'email',
                      controller: _emailcontroller,
                      icon: Icons.person,
                    ),
                    RoundedInput(
                      hint: 'phone',
                      controller: _callcontroller,
                      icon: Icons.call,
                    ),
                    RoundedPasswordInput(
                      hint: 'Password',
                      controller: _passwordcontroller,
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      title: 'SIGN UP',
                      callback: () {},
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
