// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../Network/api_const.dart';

// // Define the data model classes
// class SubType {
//   int id;
//   String name;
//   String priceRate;
//   String image;
//   String description;
//   int rate;

//   SubType({
//     required this.id,
//     required this.name,
//     required this.priceRate,
//     required this.image,
//     required this.description,
//     required this.rate,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'price_rate': priceRate,
//       'image': image,
//       'description': description,
//       'Rate': rate,
//     };
//   }
// }

// class Post {
//   String serviceType;
//   String icon;
//   String about;
//   String imageUrl;
//   List<SubType> subTypes;

//   Post({
//     required this.serviceType,
//     required this.icon,
//     required this.about,
//     required this.imageUrl,
//     required this.subTypes,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'service_type': serviceType,
//       'icon': icon,
//       'about': about,
//       'image_url': imageUrl,
//       'sub_types': subTypes.map((subType) => subType.toMap()).toList(),
//     };
//   }
// }

// // Function to create a new post in MongoDB
// Future<void> createPost(Post post) async {
//   final apiUrl = '${ApiConst.baseUrl}api/posts'; // Replace with your actual API URL

//   final response = await http.post(
//     Uri.parse(apiUrl),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(post.toMap()),
//   );

//   if (response.statusCode == 201) {
//     print('Data stored in MongoDB successfully!');
//   } else {
//     print('Failed to create post. Error: ${response.body}');
//   }
// }


// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MongoDB Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('MongoDB Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               // Create a new Post instance
//               final post = Post(
//                 serviceType: 'Service Type 1',
//                 icon: 'icon.png',
//                 about: 'About Service Type 1',
//                 imageUrl: 'image_url.png',
//                 subTypes: [
//                   SubType(
//                     id: 1,
//                     name: 'Sub Type 1',
//                     priceRate: 'Price Rate 1',
//                     image: 'sub_image1.png',
//                     description: 'Description 1',
//                     rate: 100,
//                   ),
//                   SubType(
//                     id: 2,
//                     name: 'Sub Type 2',
//                     priceRate: 'Price Rate 2',
//                     image: 'sub_image2.png',
//                     description: 'Description 2',
//                     rate: 200,
//                   ),
//                 ],
//               );

//               await createPost(post);
//             },
//             child: const Text('Store Data in MongoDB'),
//           ),
//         ),
//       ),
//     );
//   }
// }
