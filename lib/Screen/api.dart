import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyData extends StatefulWidget {

   final String title;
  final int id;
  final int UserId;
  final String body;

  MyData({required this.title,required this.body, required this.id,required this.UserId});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      UserId: json['UserId'], body: json['body'], id: json['id'], title: json['title'],
    );
  }

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
    List<MyData> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/data'));

      if (response.statusCode == 200) {
        List<dynamic> dataJson = json.decode(response.body);
        List<MyData> data =
            dataJson.map((json) => MyData.fromJson(json)).toList();
        setState(() {
          _data = data;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_data[index].title),
            subtitle: Text('Age: ${_data[index].id}'),
          );
        },
      ),
    );
  }
}



