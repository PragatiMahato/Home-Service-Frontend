// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Network/api_response.dart';
import '../Provider/signup_provider.dart';
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
      Navigator.of(context).pop();
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
                    // const SizedBox(height: 40),
                    // Image.asset('assets/images/login.png'),
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
                    // RoundedInput(
                    //   hint: 'phone',
                    //   controller: _callcontroller,
                    //   icon: Icons.call,
                    // ),
                    RoundedPasswordInput(
                      hint: 'Password',
                      controller: _passwordcontroller,
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      title: 'SIGN UP',
                      callback: () {
                        context.read<SignUpProvider>().signUp(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text,
                            );
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
