import 'package:flutter/material.dart';

import '../Screen/foget_pw.dart';
import '../Screen/home.dart';
import 'button.dart';
import 'input_fielda.dart';
import 'socialmedia_icons.dart';


class LoginForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 27
                  ),
                ),

                const SizedBox(height: 40),

                Image.asset('assets/images/login.png'),

                const SizedBox(height: 70),

                const RoundedPasswordInput(hint: 'Username',icon: Icons.mail,),

                const RoundedPasswordInput(hint: 'Password'),
                Container(margin: const EdgeInsets.only(left: 165,),
                  child: TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => (  ChangePwScreen())));
                  }, child: const Text("Forget Password?",style: TextStyle(color: Colors.black),)),
                ),
                 const SizedBox(height: 15),

                 RoundedButton(title: 'LOGIN',callback: (){
                   Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (const HomePage())));
                 },),
const SizedBox(height: 18,),
const SocialIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}