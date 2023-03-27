import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List services = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('${ApiConst.baseUrl}posts'));

    if (response.statusCode == 200) {
      setState(() {
        services = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch services');
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
        title: const Text('Services'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(service['service_type']),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: service['sub_types'].length,
                    itemBuilder: (context, index) {
                      final subType = service['sub_types'][index];
                      return SizedBox(
                        width: 150,
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                subType['image'],
                                width: 100,
                                height: 100,
                              ),
                              Text(subType['name']),
                              Text(subType['price_rate']),
                              Text(subType['description']),
                             
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
