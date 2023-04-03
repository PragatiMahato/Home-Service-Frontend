// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import '../Network/api_response.dart';
import '../Provider/getservice_provider.dart';

class ServiceTypesScreen extends StatefulWidget {
  const ServiceTypesScreen({Key? key}) : super(key: key);

  @override
  _ServiceTypesScreenState createState() => _ServiceTypesScreenState();
}

class _ServiceTypesScreenState extends State<ServiceTypesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetServiceProvider>(
        builder: (context, value, child) {
          if (value.getServiceResponse.status == Status.success) {
            final getResult = value.getServiceResponse.data!;
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[300],
                );
              },
              itemCount: getResult.length,
              itemBuilder: (BuildContext context, int index) {
                final getService = getResult[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SubTypesPage(
                    //       _serviceTypes[index].subTypes,
                    //       serviceType: _serviceTypes[index],
                    //     ),
                    //   ),
                    // );
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
                                  getService.image_url.toString(),
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
                                        left: AppSize.s30),
                                    child: Text(
                                      getService.service_type.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: AppSize.s10, left: AppSize.s30),
                                    child: Text(
                                      getService.about.toString(),
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
