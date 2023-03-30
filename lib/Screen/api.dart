// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:fyp/Screen/rating.dart';
import 'package:fyp/Screen/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Constant/colors.dart';
import '../Network/api_const.dart';
import '../Provider/booking_provider.dart';
import '../model/booking_models.dart';
import '../model/service_modal.dart';
import 'map.dart';
import 'mybooking_history.dart';

class ServiceTypesPage extends StatefulWidget {
  const ServiceTypesPage({super.key});

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
                            serviceTypes[index].image_url,
                            height: 70,
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
                                serviceTypes[index].service_type,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: AppSize.s10, left: AppSize.s30),
                              child: Text(
                                serviceTypes[index].about,
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

  const SubTypesPage(this.subTypes, {super.key, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceType.service_type),
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
                return SubTypeDetailsPage(
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

class SubTypeDetailsPage extends StatefulWidget {
  final SubType subType;
  final String address;

  const SubTypeDetailsPage(
      {Key? key, required this.subType, required this.address})
      : super(key: key);

  @override
  State<SubTypeDetailsPage> createState() => _SubTypeDetailsPageState();
}

class _SubTypeDetailsPageState extends State<SubTypeDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _totalPriceController = TextEditingController();
  final _datecontroller = TextEditingController();
  DateTime? _selectedDate;

  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.address);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _datecontroller.text = picked.toString();
      });
    }
  }

  Future<void> _submitForm() async {
    const url = '${ApiConst.baseUrl}bookService';
    final response = await http.post(Uri.parse(url), body: {
      'name': _nameController.text,
      'total_price': _totalPriceController.text,
      'date': _datecontroller.text,
      'location': _locationController.text,
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking successful')),
      );

      // Clear form fields
      _nameController.clear();
      _totalPriceController.clear();
      _datecontroller.clear();
      _locationController.clear();
    } else {
      print(response.statusCode == 309);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error booking service')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subType.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 1),
              height: 200,
              width: double.infinity,
              child: Image.network(
                widget.subType.image,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subType.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subType.description,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  const RatingScreen(serviceId: '6408722c78393a6fb6ab76fe'),
                  const SizedBox(height: 13),
                  Text(
                    'Price : ${widget.subType.price_rate}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                  height: AppSize.getScreenHeight(context) * 0.85,
                  decoration: const BoxDecoration(
                      color: backgroundWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 40, left: 30, right: 30),
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            "Receiver Name",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          )),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 255),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        padding: AppSize.globalSymetricpadding * 0.2,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: 'Type Name',
                            border: InputBorder.none,
                            // suffixIcon: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            "Select Date",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          )),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 255),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        padding: AppSize.globalSymetricpadding * 0.2,
                        child: TextField(
                          controller: _datecontroller,
                          onTap: () => _selectDate(context),
                          decoration: const InputDecoration(
                            hintText: 'Select date',
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            "Receiver Name",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          )),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 255),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        padding: AppSize.globalSymetricpadding * 0.2,
                        child: TextField(
                          controller: _locationController,
                          decoration: InputDecoration(
                              hintText: "Set you location",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const MapSample();
                                    }));
                                  },
                                  icon: const Icon(Icons.location_on))),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(widget.subType.price_rate),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.only(
                              top: AppSize.s30,
                              left: AppSize.s20 * 3,
                              bottom: AppSize.s30),
                          height: 50,
                          width: AppSize.getScreenWidth(context) * 0.7,
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Make Payayment With Khalti",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 18),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 50,
                              width: AppSize.getScreenWidth(context) * 0.4,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ==
                                        true) {
                                      _submitForm().then((value) =>
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const MyBookingHistory();
                                          })));
                                    }
                                    BookingDetails bookingDetails =
                                        BookingDetails(
                                      name: _nameController.text,
                                      location: _locationController.text,
                                      total_price: _totalPriceController.text,
                                      id: DateTime.now().microsecondsSinceEpoch,
                                      date: _datecontroller.text,
                                    );
                                    Provider.of<BookingNotifier>(context,
                                            listen: false)
                                        .addNote(bookingDetails);
                                  },
                                  child: const Text(
                                    "Confirm Booking",
                                    style: TextStyle(
                                        color: backgroundWhite, fontSize: 18),
                                  ))),
                          Container(
                              height: 50,
                              width: AppSize.getScreenWidth(context) * 0.35,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const HomePage();
                                    }));
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: backgroundWhite, fontSize: 18),
                                  ))),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
