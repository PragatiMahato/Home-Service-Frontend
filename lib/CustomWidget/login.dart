// ignore_for_file: use_build_context_synchronously, unused_field

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/service_modal.dart';
import 'package:http/http.dart' as http;

import '../Constant/colors.dart';
import '../Network/api_const.dart';
import '../Screen/foget_pw.dart';
import '../Screen/taskbar.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
   LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize, required SubType subType, 
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  // final SubType subType;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordObsecured = true;
  late String _email;
  late String _password;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final SubType subType =
      SubType(image: '', name: '', description: '', price_rate: '');


  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('${ApiConst.baseUrl}login'),
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      // Navigate to the next screen and pass the user data
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return  BottomNavBar(
          subType: subType,
        );
      }));
    } else if (response.statusCode == 401) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid email or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(35)),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: kPrimaryColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Email",
                          suffixIcon: Icon(Icons.email, color: kPrimaryColor),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(35)),
                    child: TextFormField(
                      obscureText: passwordObsecured,
                      controller: _passwordController,
                      cursorColor: kPrimaryColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObsecured = !passwordObsecured;
                                });
                              },
                              icon: Icon(
                                passwordObsecured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kPrimaryColor,
                              )),
                          border: InputBorder.none),
                    ),
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
                    callback: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   Provider.of<LoginProvider>(context, listen: false)
                      //       .login(
                      //           email: _emailController.text,
                      //           password: _passwordController.text);
                      // }
                      // else {
                      //     return;
                      //   }

                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
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
      ),
    );
  }
}
