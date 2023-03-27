import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backgroundWhite,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Card(
                color: const Color.fromARGB(255, 233, 240, 255),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(
                          "assets/images/help.png",
                          height: 55,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "Contact our support at any time for your queries or any help",
                      style: TextStyle(
                          fontSize: 16,
                          wordSpacing: 1,
                          letterSpacing: 0.8,
                          color: textColor),
                    ))
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppSize.s20, horizontal: AppSize.s30),
                child: const Text(
                  "Contact Us ",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSize.s30),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                  child: const Icon(
                    Icons.call,
                    color: backgroundWhite,
                    size: 26,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Call",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("9825854689")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSize.s30),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                  child: const Icon(
                    Icons.mail,
                    color: backgroundWhite,
                    size: 20,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Email Us",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("homecare@gail.com")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
