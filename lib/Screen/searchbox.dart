// import 'package:flutter/material.dart';

// class SearchScreen extends StatelessWidget {
//   final TextEditingController _searchController = TextEditingController();

//   SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search',
//             suffixIcon: IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SearchResultScreen(
//                       query: _searchController.text,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         // Your search screen body here
//       ),
//     );
//   }
// }

// class SearchResultScreen extends StatelessWidget {
//   final String query;

//   const SearchResultScreen({super.key, required this.query});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Results for "$query"'),
//       ),
//       body: Container(
//         // Your search result screen body here
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 100),
      child: RatingBar.builder(
        initialRating: 2,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) => debugPrint(rating.toString()),
      ),
    ));
  }
}
