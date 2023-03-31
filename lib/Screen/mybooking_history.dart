

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Network/api_const.dart';

class MyBookingHistory extends StatefulWidget {
  MyBookingHistory({Key? key,}) : super(key: key);


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


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          );
        },
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final history = data[index];
          return Container(
              color: const Color.fromARGB(255, 239, 236, 255),
              padding: const EdgeInsets.symmetric(horizontal:AppSize.s20),
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
                          Text(
                            history['location']
                          ),
                          Text(
                            history['total_price'].toString(),
                          ),
                        ]),
                  ),
            
                ],
              ),
            );
        },
      ),
    );
  }
}



