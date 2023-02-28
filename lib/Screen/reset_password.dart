import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../CustomWidget/button.dart';
import 'services.dart';

class ResetPWScreen extends StatefulWidget {
  const ResetPWScreen({super.key});

  @override
  State<ResetPWScreen> createState() => _ResetPWScreenState();
}

class _ResetPWScreenState extends State<ResetPWScreen> {
  bool passwordObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppSize.getScreenWidth(context),
        height: AppSize.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("Reset Password",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 95, 95, 95),fontWeight: FontWeight.w600),),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  obscureText: passwordObsecured,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontSize: 17),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color.fromARGB(255, 178, 178, 178)),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.6),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObsecured = !passwordObsecured;
                            });
                          },
                          icon: Icon(passwordObsecured
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: passwordObsecured,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: ' Confirm Password',
                      hintStyle: const TextStyle(fontSize: 17),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color.fromARGB(255, 178, 178, 178)),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.6),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObsecured = !passwordObsecured;
                            });
                          },
                          icon: Icon(passwordObsecured
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                const SizedBox(
                  height: 60,
                ),
                
                RoundedButton(callback: () { 
                   Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => (  const HomePage())));
                 }, title: 'Continue',borderRadius: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
