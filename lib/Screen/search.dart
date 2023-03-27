// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});


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
          return ListTile(
            title: Text(post['service_type']),
            // subtitle: Text(post['description']),
          );
        },
      ),
    );
  }
}
