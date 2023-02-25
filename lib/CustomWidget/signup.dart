import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/firebase_auth_methods.dart';
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
  late final TextEditingController _emailcontroller;
  late final TextEditingController _passwordcontroller;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  Image.asset('assets/images/login.png'),
                  const SizedBox(height: 40),
                  // const RoundedPasswordInput(
                  //   hint: 'Username',
                  //   icon: Icons.mail,
                  // ),
                   RoundedPasswordInput(
                    hint: 'email',
                    controller: _emailcontroller,
                    icon: Icons.person,
                  ),
                   RoundedPasswordInput(hint: 'Password',controller: _passwordcontroller,),
                  // const RoundedPasswordInput(hint: 'Confirm Password'),
                  const SizedBox(height: 10),
                  RoundedButton(
                    title: 'SIGN UP',
                    callback: () async{
                      signUpUser();
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUpUser() async {
    FirebaseAuthMethod(FirebaseAuth.instance).signUpWithEmail(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        context: context);
  }
}
