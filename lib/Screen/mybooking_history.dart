// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Network/api_const.dart';
import '../model/service_modal.dart';

class MyBookingHistory extends StatefulWidget {
  const MyBookingHistory({
    Key? key,
    required this.subType,
  }) : super(key: key);

  final SubType subType;

  @override
  _MyBookingHistoryState createState() => _MyBookingHistoryState();
}

class _MyBookingHistoryState extends State<MyBookingHistory> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('${ApiConst.baseUrl}getbookings'));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> deleteUser(String id) async {
    final response =
        await http.delete(Uri.parse('${ApiConst.baseUrl}deletebooking/$id'));
    if (response.statusCode == 200) {
      setState(() {
        data.removeWhere((user) => user['_id'] == id);
      });
    } else {
      throw Exception('Failed to delete user');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final history = data[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: const Color.fromARGB(255, 239, 236, 255),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s20, vertical: AppSize.s20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          history['name'].toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.subType.name,
                          style: const TextStyle(
                              color: textColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          history['date'].toString(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(history['location'].toString()),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.subType.price_rate,
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 16,
                          ),
                        ),
                      ]),
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
                                deleteUser(history['_id']);
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
