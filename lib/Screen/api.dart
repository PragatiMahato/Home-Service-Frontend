// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:http/http.dart' as http;

import '../Constant/colors.dart';
import '../Network/api_const.dart';
import '../model/service_modal.dart';
import 'booking.dart';

class ServiceTypesPage extends StatefulWidget {
  const ServiceTypesPage({Key? key});

  @override
  _ServiceTypesPageState createState() => _ServiceTypesPageState();
}

class _ServiceTypesPageState extends State<ServiceTypesPage> {
  List<ServiceType> serviceTypes = [];

  Future<void> getServiceTypes() async {
    var response = await http.get(Uri.parse('${ApiConst.baseUrl}posts'));
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
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          );
        },
        itemCount: serviceTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubTypesPage(
                    serviceTypes[index].subTypes,
                    serviceType: serviceTypes[index],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppSize.s20,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            serviceTypes[index].image_url?.startsWith('http') == true
                                ? serviceTypes[index].image_url!
                                : 'http://192.168.101.4:3000'+ serviceTypes[index].image_url!,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: AppSize.s30),
                              child: Text(
                                serviceTypes[index].service_type.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: AppSize.s10, left: AppSize.s30),
                              child: Text(
                                serviceTypes[index].about.toString(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
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
      ),
    );
  }
}


class SubTypesPage extends StatelessWidget {
  final List<SubType> subTypes;
  final ServiceType serviceType;

  const SubTypesPage(
    this.subTypes, {
    super.key,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceType.service_type.toString()),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          );
        },
        itemCount: subTypes.length,
        itemBuilder: (BuildContext context, int index) {
          // return ListTile(
          //   title: Text(subTypes[index].name),
          // );
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BookingPage(
                  subType: subTypes[index],
                  address: '',
                );
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s10, horizontal: AppSize.s20),
                  child: Row(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            subTypes[index].image,
                            height: 70,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subTypes[index].name,
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    subTypes[index].description,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    subTypes[index].price_rate,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
