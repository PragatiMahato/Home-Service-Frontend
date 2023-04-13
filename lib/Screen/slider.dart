// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/model/service_modal.dart';
import 'package:http/http.dart' as http;

import '../Constant/colors.dart';
import '../Network/api_const.dart';
import 'api.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<ServiceType> serviceTypes = [];

  Future<void> getServiceTypes() async {
    var response = await http.get(Uri.parse('${ApiConst.baseUrl}getposts'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<ServiceType> serviceTypesList = [];
      for (var serviceType in jsonData) {
        serviceTypesList.add(ServiceType.fromJson(serviceType));
      }
      setState(() {
        serviceTypes = serviceTypesList;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getServiceTypes();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: serviceTypes.length,
        itemBuilder: (context, index) {
          final post = serviceTypes[index];
          print(post.icon);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubTypesPage(post.subTypes, serviceType: post)),
              );
            },
            child: Container(
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2.5),
                  borderRadius: BorderRadius.circular(13),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Image.network(
                    post.icon.toString(),
                    height: 40,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    post.service_type.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kTextColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
