// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Network/api_response.dart';
import 'package:fyp/Provider/login_provider.dart';
import 'package:fyp/Screen/services.dart';
import 'package:provider/provider.dart';

import '../Constant/colors.dart';
import '../Screen/foget_pw.dart';
import 'button.dart';

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
  bool passwordObsecured = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late String _email;
  late String _password;

  bool hidePassword = true;
  bool isLoggedIn = false;

  late final LoginProvider loginProvider;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    loginProvider = context.read<LoginProvider>();
    loginProvider.addListener(loginListner);
  }

  void loginListner() {
    if (loginProvider.loginResponse.status == Status.error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(loginProvider.loginResponse.error.toString())));
    } else if (loginProvider.loginResponse.status == Status.success) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (_) => false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    loginProvider.removeListener(loginListner);
    super.dispose();
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
              key: _formkey,
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
                      if (_formkey.currentState!.validate()) {
                        Provider.of<LoginProvider>(context, listen: false)
                            .login(
                                email: _emailController.text,
                                password: _passwordController.text);
                      }
                      else {
                          return;
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
