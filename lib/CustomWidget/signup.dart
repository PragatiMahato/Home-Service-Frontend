// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screen/login.dart';
import 'package:provider/provider.dart';

import '../Constant/colors.dart';
import '../Network/api_response.dart';
import '../Provider/signup_provider.dart';
import 'button.dart';

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
  bool passwordObsecured = true;
  late String _email;
  late String _password;
  late final TextEditingController _emailcontroller;
  late final TextEditingController _usernamecontroller;
  late final TextEditingController _passwordcontroller;

  late final SignUpProvider signUpProvider;

  @override
  void initState() {
    super.initState();
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _usernamecontroller = TextEditingController();
    signUpProvider = context.read<SignUpProvider>();
    signUpProvider.addListener(signUpListner);
  }

  void signUpListner() {
    if (signUpProvider.apiResponse.status == Status.error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(signUpProvider.apiResponse.error.toString())));
    } else if (signUpProvider.apiResponse.status == Status.success) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    signUpProvider.removeListener(signUpListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor.withAlpha(35)),
                      child: TextFormField(
                        controller: _usernamecontroller,
                        cursorColor: kPrimaryColor,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Full Name",
                            suffixIcon:
                                Icon(Icons.person, color: kPrimaryColor),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor.withAlpha(35)),
                      child: TextFormField(
                        controller: _emailcontroller,
                        cursorColor: kPrimaryColor,
                        keyboardType: TextInputType.emailAddress,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor.withAlpha(35)),
                      child: TextFormField(
                        obscureText: passwordObsecured,
                        controller: _passwordcontroller,
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
                    const SizedBox(height: 10),
                    RoundedButton(
                      title: 'SIGN UP',
                      callback: () {
                        if (_formkey.currentState!.validate()) {
                          context.read<SignUpProvider>().signUp(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text,
                                name: _usernamecontroller.text,
                              );
                        } else {
                          return;
                        }
                      },
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
