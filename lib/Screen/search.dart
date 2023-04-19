// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_colors.dart';
import 'package:fyp/Screen/api.dart';
import 'package:provider/provider.dart';

import '../Constant/app_size.dart';
import '../Network/api_response.dart';
import '../Provider/searchprovider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: const TextStyle(fontSize: 18, color: backgroundWhite),
          decoration: const InputDecoration(hintText: 'Search by type'),
          onSubmitted: (String keyword) {
            context.read<SearchProvider>().searchPosts(keyword: keyword);
          },
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, value, child) {
          final searchResponse = value.getSearchResponse;
          if (searchResponse.status == Status.success) {
            final searchResults = searchResponse.data!;
            if (searchResults.isNotEmpty) {
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final post = searchResults[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubTypesPage(
                            post.subTypes,
                            serviceType: post,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppSize.s20,
                        vertical: AppSize.s20,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              post.image_url.toString(),
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
                                  post.service_type.toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(post.about.toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No results found.'),
              );
            }
          } else if (searchResponse.status == Status.error) {
            return Center(
              child: Text('Error: ${searchResponse.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
