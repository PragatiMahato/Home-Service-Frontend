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
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Card(
                color: const Color.fromARGB(255, 233, 240, 255),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(
                          "assets/images/pp.png",
                          height: 65,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "jkvbd isazhvjkizdasv ihvmnrtt saiodvhzds vihsa vahg ygy",
                      style: TextStyle(fontSize: 17),
                    ))
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppSize.s30, horizontal: AppSize.s30),
                child: const Text("Contact Us "))
          ],
        ),
      ),
    );
  }
}
