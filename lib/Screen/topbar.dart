// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:fyp/Constant/app_size.dart';
// import 'package:provider/provider.dart';

// import '../Network/api_response.dart';
// import '../Provider/searchprovider.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({
//     super.key,
//   });

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   List<dynamic> _searchResults = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: const InputDecoration(hintText: 'Search by type'),
//           onSubmitted: (String keyword) {
//             context.read<SearchProvider>().searchPosts(keyword: keyword);
//           },
//         ),
//       ),
//       body: Consumer<SearchProvider>(
//         builder: (context, value, child) {
//           if (value.getSearchResponse.status == Status.success) {
//             final searchResults = value.getSearchResponse.data!;
//             return ListView.builder(
//               itemCount: searchResults.length,
//               itemBuilder: (context, index) {
//                 final post = searchResults[index];
//                 return GestureDetector(
//                   onDoubleTap: () {},
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: AppSize.s20,
//                       vertical: AppSize.s20,
//                     ),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             post.image_url,
//                             height: 70,
//                             width: 100,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 post.service_type,
//                                 style: const TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 3,
//                               ),
//                               Text(post.about),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }