import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../CustomWidget/button.dart';


class ChangePwScreen extends StatefulWidget {
  const ChangePwScreen({super.key});

  @override
  State<ChangePwScreen> createState() => _ChangePwScreenState();
}

class _ChangePwScreenState extends State<ChangePwScreen> {
  late final TextEditingController _emailcontroller;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
      ),
      body: SizedBox(
        width: AppSize.s10 * 50,
        height: AppSize.s30 * 14,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                const Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 78, 78, 78)),
                ),
                const Spacer(),
                const Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                TextFormField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      suffixIcon: Icon(Icons.email_outlined)),
                ),
                const Spacer(),
                RoundedButton(
                  callback: () {
                   
                  },
                  title: 'Continue',
                  borderRadius: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
