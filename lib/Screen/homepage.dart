// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fyp/Screen/api.dart';
import 'package:provider/provider.dart';

import '../Constant/app_colors.dart';
import '../CustomWidget/category.dart';
import '../CustomWidget/searchbar.dart';
import '../CustomWidget/sliver_sizedbox.dart';
import '../Network/api_response.dart';
import '../Provider/login_provider.dart';
import 'slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundWhite,
      // drawer: const Navbar(),

      body: Consumer<LoginProvider>(builder: (context, value, child) {
        if (value.loginResponse.status == Status.success) {
          final users = value.loginResponse.data!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert)),
                title: Column(
                  children: [
                    Text(
                      users.name,
                      style: const TextStyle(fontSize: 23),
                    ),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 240,
                      child: Stack(
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
                                      blurRadius: 50,
                                      color: kPrimaryColor.withOpacity(0.45))
                                ],
                              ),
                              child: const SearchBox(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Category(
                  text: 'Our Services',
                  buttonText: 'More',
                  press: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context){return SubTypesPage(subTypes, serviceType: serviceType)}))
                  },
                ),
              ),
              const SliverSizedBox(height: 20),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 66,
                  child: SliderScreen(),
                ),
              ),
              const SliverSizedBox(height: 45),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Featured Services",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              ServiceTypesPage()
            ],
          );
        }
        return const SizedBox();
      }),
    );
  }
}
