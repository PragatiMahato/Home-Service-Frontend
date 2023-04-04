import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../CustomWidget/category.dart';
import '../CustomWidget/searchbar.dart';
import 'api.dart';
import 'navbar.dart';
import 'slider.dart';

class HomePageHeade extends StatelessWidget {
  const HomePageHeade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundWhite,
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: const [Icon(Icons.notifications)],
        title: const Text("Location"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.13,
                          decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(44),
                                  bottomRight: Radius.circular(44))),
                        ),
                        Positioned(
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 84),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 4),
                            height: 60,
                            decoration: BoxDecoration(
                              color: backgroundWhite,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 15),
                                    blurRadius: 60,
                                    color: kPrimaryColor.withOpacity(0.45))
                              ],
                            ),
                            child: const SearchBox(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Category(
                  text: 'Our Services',
                  buttonText: 'More',
                  press: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context){return SubTypesPage(subTypes, serviceType: serviceType)}))
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 66, child: SliderScreen()),
                const SizedBox(height: 45),
                Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Featured Services",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ServiceTypesPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
