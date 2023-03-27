// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Screen/booking.dart';
import 'package:fyp/Screen/serviceapi.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import '../Network/api_const.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('${ApiConst.baseUrl}posts'));

    if (response.statusCode == 200) {
      setState(() {
        _posts = json.decode(response.body);
        // log(_posts.toString());
      });
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const MyHomePage();
              }));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppSize.s20, ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            post['image_url'],
                            height: 70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: AppSize.s20),
                              child: Text(
                                post['service_type'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: AppSize.s10, left: AppSize.s20),
                              child: Text(
                                post['about'],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500,color: textColor),
                              ),
                            ),
                          
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: AppSize.s30 * 7, bottom: AppSize.s20),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const Booking(address: 'address',);
                                      }));
                                    },
                                    child: const Text(
                                      "Book Now",
                                      style: TextStyle(color: backgroundWhite),
                                    ))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          );
        },
      ),
    );
  }
}
