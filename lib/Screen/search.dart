// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  void _searchPosts(String keyword) async {
    final response = await http
        .get(Uri.parse('${ApiConst.baseUrl}searchByType?keyword=$keyword'));
    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body);
      setState(() {
        _searchResults = results;
      });
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(hintText: 'Search by type'),
          onSubmitted: (String keyword) {
            _searchPosts(keyword);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final post = _searchResults[index];
          return GestureDetector(
            onDoubleTap: () {
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => SubTypesPage(
//       post['subtypes'].map((subType) => SubType.fromJson(subType)).toList(),
//       serviceType: ServiceType.fromJson(post),
//     ),
//   ),
// );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.s20, vertical: AppSize.s20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      post['image_url'],
                      height: 70,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['service_type'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(post['about']),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
