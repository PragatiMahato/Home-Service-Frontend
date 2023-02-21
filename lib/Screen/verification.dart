import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constant/app_size.dart';
import '../CustomWidget/button.dart';
import 'reset_password.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppSize.getScreenWidth(context),
        height: AppSize.getScreenWidth(context),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Your 4 Digit Code",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 78, 78, 78)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Please enter your email to recieve a link to create a new password via email",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 62,
                    width: 56,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 62,
                    width: 56,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 62,
                    width: 56,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 62,
                    width: 56,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              
              RoundedButton(callback: () { 
                 Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (  const ResetPWScreen())));
               }, title: 'Continue',borderRadius: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
