// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Network/api_const.dart';
import '../model/service_modal.dart';

class MyBookingHistory extends StatefulWidget {
  const MyBookingHistory(  {
    Key? key, required this.subType, required this.priceRate, 
  }) : super(key: key);

final SubType subType;
  final String priceRate;
  

  @override
  _MyBookingHistoryState createState() => _MyBookingHistoryState();
}

class _MyBookingHistoryState extends State<MyBookingHistory> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('${ApiConst.baseUrl}bookedServices'));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> deleteUser(String name) async {
    final response =
        await http.delete(Uri.parse('${ApiConst.baseUrl}bookedServices/$name'));
    if (response.statusCode == 200) {
      // setState(() {
      //   data.removeWhere((item) => item['name'] == name);
      // });
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
                          history['name'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          history['date'].toString(),
                        ),
                        Text(history['location']),
                        Text(
                          widget.priceRate
                        ),
                      ]),
                ),
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteUser(history['name']);
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
