// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({super.key});

  @override
  _UserscreenState createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  List<dynamic> userList = [];

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('${ApiConst.baseUrl}signup'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        userList = data;
      });
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response =
        await http.delete(Uri.parse('${ApiConst.baseUrl}delete/$userId'));
    if (response.statusCode == 200) {
      setState(() {
        userList.removeWhere((user) => user['_id'] == userId);
      });
    } else {
      throw Exception('Failed to delete user');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) {
            final user = userList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s20, vertical: AppSize.s10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(user['name']),
                      Text(user['email']),
                      Text(user['password']),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete User'),
                            content: const Text(
                                'Are you sure you want to delete this user?'),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  deleteUser(user['_id']);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}
