// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import '../Network/api_const.dart';
import '../model/service_modal.dart';
import 'map.dart';
import 'mybooking_history.dart';
import 'rating.dart';
import 'services.dart';

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
      firstDate: DateTime.now(),
      lastDate: DateTime(2200),
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
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
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
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Dtae must be in number';
                            }
                            return null;
                          },
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
                            "Location",
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
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please set your location';
                            }
                            return null;
                          },
                          controller: _locationController,
                          decoration: InputDecoration(
                              hintText: "Set you location",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MapSample()),
                                    ).then((address) {
                                      if (address != null) {
                                        setState(() {
                                          _locationController.text = address;
                                        });
                                      }
                                    });
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
                                    if (_formKey.currentState!.validate()) {
                                      _submitForm().then((value) =>
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return MyBookingHistory(
                                              subType: widget.subType,
                                              priceRate:
                                                  widget.subType.price_rate,
                                            );
                                          })));
                                    } else {
                                      return;
                                    }
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
