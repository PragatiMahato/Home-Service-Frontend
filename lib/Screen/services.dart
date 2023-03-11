// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:fyp/Screen/booking.dart';
import 'package:fyp/Screen/navbar.dart';

import '../CustomWidget/category.dart';
import '../CustomWidget/home_page_header.dart';
import 'googlemap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.user_name});
  final String? user_name;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundWhite,
        drawer: const Navbar(),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          actions: const [Icon(Icons.notifications)],
          title: const Text("Location"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.getScreenHeight(context),
                child: Column(
                  children: [
                    const HomePageHeader(),
                    Category(
                      text: 'Our Services',
                      buttonText: 'More',
                      press: () {},
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Category_card(
                              categoryImg: "assets/images/paint.png",
                              categoryText: "Painter",
                            ),
                            Category_card(
                              categoryImg: "assets/images/garden.png",
                              categoryText: "Gardener",
                            ),
                            Category_card(
                              categoryImg: "assets/images/cooking.png",
                              categoryText: "Cook",
                            ),
                            Category_card(
                              categoryImg: "assets/images/plumber.png",
                              categoryText: "Plumber",
                            ),
                            Category_card(
                              categoryImg: "assets/images/repair.png",
                              categoryText: "Repaier",
                            ),
                            Category_card(
                              categoryImg: "assets/images/broom.png",
                              categoryText: "Cleaner",
                            )
                          ],
                        )),
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
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 220, 227, 255),
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Image.asset(
                              "assets/images/garden1.png",
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Carpenter",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Carpenter",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const Text(
                                "Carpenter",
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_outlined,
                                    color: Color.fromARGB(255, 255, 183, 0),
                                  ),
                                  const Text(
                                    "4.1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const Booking();
                                            }));
                                          },
                                          child: const Text(
                                            "Book Now",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: backgroundWhite),
                                          ))),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const MapSample();
                                        }));
                                      },
                                      icon: const Icon(Icons.location_on))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// Future<List<ServiceModel>> ReadJsonData() async {
//   final jsondata = await rootBundle.loadString('jsonfile/api.json');
//   final list = json.decode(jsondata) as List<dynamic>;

//   return list.map((e) => ServiceModel.fromJson(e)).toList();
// }

// ignore: camel_case_types
class Category_card extends StatelessWidget {
  const Category_card({
    super.key,
    required this.categoryImg,
    required this.categoryText,
  });
  final String categoryImg;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: const Color.fromARGB(255, 232, 225, 255)),
          child: Row(
            children: [
              Image.asset(
                categoryImg,
                height: 35,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                categoryText,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: kTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
