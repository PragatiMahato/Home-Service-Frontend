// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:fyp/Screen/navbar.dart';
import 'package:fyp/Screen/slider.dart';

import '../CustomWidget/category.dart';
import '../CustomWidget/home_page_header.dart';
import 'api.dart';

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
                      press: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context){return SubTypesPage(subTypes, serviceType: serviceType)}))
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(height: 66, child: SliderScreen()),
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
                    const Expanded(child: ServiceTypesPage()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
// class Category_card extends StatelessWidget {
//   const Category_card({
//     super.key,
//     required this.categoryImg,
//     required this.categoryText,
//   });
//   final String categoryImg;
//   final String categoryText;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18),
//       child: GestureDetector(
//         onTap: () {
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           //   return const HomePage();
//           // }));
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: const Color.fromARGB(255, 232, 225, 255)),
//           child: Row(
//             children: [
//               Image.asset(
//                 categoryImg,
//                 height: 35,
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               Text(
//                 categoryText,
//                 style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: kTextColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
