// import 'package:flutter/material.dart';

// import '../Constant/colors.dart';
// import '../CustomWidget/category.dart';
// import '../CustomWidget/home_page_header.dart';
// import '../CustomWidget/sliver_sizedbox.dart';



// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//   });

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         actions: const [Icon(Icons.more_vert)],
//         title: const Text("Home Services"),
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//       ),
//       body: CustomScrollView(slivers: [
//         HomePageHeader(size: size),
//         // SliverToBoxAdapter(
//         //   child: Container(
//         //     margin: const EdgeInsets.symmetric(horizontal: 20),padding: const EdgeInsets.symmetric(horizontal: 10),
//         //     height: 120,
//         //     decoration: BoxDecoration(
//         //         color: const Color.fromARGB(255, 197,229,254), borderRadius: BorderRadius.circular(14)),
//         //         child: Row(mainAxisAlignment: MainAxisAlignment.start,
//         //           children: [Stack(
//         //             children: [Image.asset("assets/images/card.png"),
//         //                Expanded(child: Container(
//         //                 margin: const EdgeInsets.only(left: 130,top: 40),
//         //                 child: const Text("Get your home services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)),)],
//         //           )
                    
//         //           ],
//         //         ),
//         //   ),
//         // ),
//         // const SliverSizedBox(height: 45),
//         Category(
//           text: 'Category',
//           buttonText: 'More',
//           press: () {},
//         ),
//         const SliverSizedBox(height: 20),
//         SliverToBoxAdapter(
//           child: SizedBox(
//               height: 80,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: const [
//                   Category_card(
//                     categoryImg: "assets/images/paint.png",
//                     categoryText: "Painter",
//                   ),
//                   Category_card(
//                     categoryImg: "assets/images/garden.png",
//                     categoryText: "Gardener",
//                   ),
//                   Category_card(
//                     categoryImg: "assets/images/cooking.png",
//                     categoryText: "Cook",
//                   ),
//                   Category_card(
//                     categoryImg: "assets/images/plumber.png",
//                     categoryText: "Plumber",
//                   ),
//                   Category_card(
//                     categoryImg: "assets/images/repair.png",
//                     categoryText: "Repaier",
//                   ),
//                   Category_card(
//                     categoryImg: "assets/images/broom.png",
//                     categoryText: "Cleaner",
//                   )
//                 ],
//               )),
//         ),
//         const SliverSizedBox(
//           height: 45,
//         ),
//         Category(
//           text: 'Recommended',
//           buttonText: 'View all',
//           press: () {},
//         ),
//         const SliverSizedBox(height: 15),
//         SliverPadding(
//             padding: const EdgeInsets.all(10),
//             sliver: SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return Column(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const RecommendedService(
//                         img: 'assets/images/garden1.png',
//                         name: 'By Mr.Arbin Kumar',
//                         price: 'Rs.500/hr',
//                         title: 'House Cleaning',
//                         rate: '4.5',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const RecommendedService(
//                         img: 'assets/images/garden1.png',
//                         name: 'By Mr.Arbin Kumar',
//                         price: 'Rs.500/hr',
//                         title: 'House Cleaning',
//                         rate: '4.0',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const RecommendedService(
//                         img: 'assets/images/garden1.png',
//                         name: 'By Mr.Arbin Kumar',
//                         price: 'Rs.500/hr',
//                         title: 'House Cleaning',
//                         rate: '4.5',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const RecommendedService(
//                         img: 'assets/images/garden1.png',
//                         name: 'By Mr.Arbin Kumar',
//                         price: 'Rs.500/hr',
//                         title: 'House Cleaning',
//                         rate: '4.5',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const RecommendedService(
//                         img: 'assets/images/garden1.png',
//                         name: 'By Mr.Arbin Kumar',
//                         price: 'Rs.500/hr',
//                         title: 'House Cleaning',
//                         rate: '4.5',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             )),
//       ]),
//     );
//   }
// }

// class RecommendedService extends StatelessWidget {
//   const RecommendedService({
//     super.key,
//     required this.img,
//     required this.title,
//     required this.name,
//     required this.price,
//     required this.rate,
//   });
//   final String img;
//   final String title;
//   final String name;
//   final String price;
//   final String rate;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       width: size.width * 0.9,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 230, 218, 255),
//           borderRadius: BorderRadius.circular(15)),
//       child: Row(
//         children: [
//           Image.asset(
//             img,
//             height: 90,
//           ),
//           const SizedBox(
//             width: 55,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 title,
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 name,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//               ),
//               const SizedBox(
//                 height: 9,
//               ),
//               Text(
//                 price,
//               ),
//               const SizedBox(
//                 height: 7,
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.star_outlined,
//                     color: Color.fromARGB(255, 255, 183, 0),
//                   ),
//                   Text(
//                     rate,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w700, fontSize: 15),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: camel_case_types
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
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13),
//             color: const Color.fromARGB(255, 232, 225, 255)),
//         child: Row(
//           children: [
//             Image.asset(
//               categoryImg,
//               height: 35,
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Text(
//               categoryText,
//               style: const TextStyle(
//                   fontSize: 15, fontWeight: FontWeight.w600, color: kTextColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:fyp/Constant/colors.dart';
// import 'package:fyp/Screen/googlemap.dart';
// import 'package:fyp/Screen/navbar.dart';
// import 'package:provider/provider.dart';

// import '../CustomWidget/category.dart';
// import '../CustomWidget/home_page_header.dart';
// import '../Modal/service_modal.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key, this.user_name});
//   final String? user_name;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: backgroundWhite,
//       drawer: const Navbar(),
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         actions: const [Icon(Icons.more_vert)],
//         title: Text("Home Service"),
//       ),
//       body: Consumer<ServicesNotifier>(
//           builder: (context, ServicesNotifier, child) {
//         return ListView.builder(
//           itemCount: ServicesNotifier.services.length,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () async {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: ((context) =>
//                 //             EditService(service: ServicesNotifier.services[index]))));
//               },
//               child: Column(
//                 children: [
//                   HomePageHeader(size: size),
//                   Category(
//                     text: 'Category',
//                     buttonText: 'More',
//                     press: () {},
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                       height: 80,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: const [
//                           Category_card(
//                             categoryImg: "assets/images/paint.png",
//                             categoryText: "Painter",
//                           ),
//                           Category_card(
//                             categoryImg: "assets/images/garden.png",
//                             categoryText: "Gardener",
//                           ),
//                           Category_card(
//                             categoryImg: "assets/images/cooking.png",
//                             categoryText: "Cook",
//                           ),
//                           Category_card(
//                             categoryImg: "assets/images/plumber.png",
//                             categoryText: "Plumber",
//                           ),
//                           Category_card(
//                             categoryImg: "assets/images/repair.png",
//                             categoryText: "Repaier",
//                           ),
//                           Category_card(
//                             categoryImg: "assets/images/broom.png",
//                             categoryText: "Cleaner",
//                           )
//                         ],
//                       )),
//                   const SizedBox(
//                     height: 45,
//                   ),
//                   Category(
//                     text: 'Recommended',
//                     buttonText: 'View all',
//                     press: () {},
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 15, right: 15),
//                     decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 220, 227, 255),
//                         borderRadius: BorderRadius.circular(13)),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           child: Image.asset(
//                             "assets/images/garden1.png",
//                             height: 100,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 30,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               ServicesNotifier.services[index].title,
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               ServicesNotifier.services[index].name,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 16),
//                             ),
//                             Text(
//                               ServicesNotifier.services[index].price,
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star_outlined,
//                                   color: Color.fromARGB(255, 255, 183, 0),
//                                 ),
//                                 const Text(
//                                   "4.1",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   width: 50,
//                                 ),
//                                 Container(
//                                     height: 30,
//                                     width: 80,
//                                     decoration: BoxDecoration(
//                                         color: Colors.green,
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: TextButton(
//                                         onPressed: () {},
//                                         child: const Text(
//                                           "Buy Now",
//                                           style:
//                                               TextStyle(color: backgroundWhite),
//                                         ))),
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(builder: (context) {
//                                         return const MapSample();
//                                       }));
//                                     },
//                                     icon: const Icon(Icons.location_on))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// // ignore: camel_case_types
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
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13),
//             color: const Color.fromARGB(255, 232, 225, 255)),
//         child: Row(
//           children: [
//             Image.asset(
//               categoryImg,
//               height: 35,
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Text(
//               categoryText,
//               style: const TextStyle(
//                   fontSize: 15, fontWeight: FontWeight.w600, color: kTextColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
