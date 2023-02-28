// import 'package:flutter/material.dart';

// import '../Constant/colors.dart';
// import 'searchbar.dart';


// class HomePageHeader extends StatelessWidget {
//   const HomePageHeader({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: size.height * 0.13,
//                 decoration: const BoxDecoration(
//                     color: kPrimaryColor,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(44),
//                         bottomRight: Radius.circular(44))),
//               ),
//               Positioned(
//                   child: Container(
//                 alignment: Alignment.center,
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 35, vertical: 84),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
//                 height: 54,
//                 decoration: BoxDecoration(
//                     color: backgroundWhite,
//                     borderRadius: BorderRadius.circular(26),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 20),
//                           blurRadius: 80,
//                           color: kPrimaryColor.withOpacity(0.25))
//                     ]),
//                 child: const SearchBox(),
//               ))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import 'searchbar.dart';


class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              margin:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 84),
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
              height: 60,
              decoration: BoxDecoration(
                  color: backgroundWhite,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 15),
                        blurRadius: 80,
                        color: kPrimaryColor.withOpacity(0.4))
                  ]),
              child: const SearchBox(),
            ))
          ],
        ),
      ],
    );
  }
}
