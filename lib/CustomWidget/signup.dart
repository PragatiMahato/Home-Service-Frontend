import 'package:flutter/material.dart';

import 'button.dart';
import 'input_fielda.dart';


class RegisterForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),

                  const SizedBox(height: 40),

                  Image.asset('assets/images/login.png'),

                  const SizedBox(height: 40),

                  const RoundedPasswordInput(hint: 'Username',icon: Icons.mail,),

                  const RoundedPasswordInput(hint: 'Name',icon: Icons.person,),

                  const RoundedPasswordInput(hint: 'Password'),
                   const RoundedPasswordInput(hint: 'Confirm Password'),

                  const SizedBox(height: 10),

                   RoundedButton(title: 'SIGN UP', callback: () {  },),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




