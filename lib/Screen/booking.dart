import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import 'googlemap.dart';

const List<String> list = <String>[
  'Esewa',
  'Khalti',
];

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final TextEditingController _datecontroller = TextEditingController();
  DateTime? _selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 183, 172, 241),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60),
              height: AppSize.getScreenHeight(context) * 0.27,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.arrow_back_ios_new),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "House Cleaning",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      Text("Rs.200/hr")
                    ],
                  ),
                  Image.asset(
                    "assets/images/cleaning.png",
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
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
                        margin:
                            const EdgeInsets.only(top: 40, left: 30, right: 30),
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
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Type Name',
                          border: InputBorder.none,
                          // suffixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                    Container(
                        margin:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const Text(
                          "Phone Number",
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
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter number',
                          border: InputBorder.none,
                          // suffixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                    Container(
                        margin:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                        margin:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                        decoration: InputDecoration(
                            hintText: 'Location',
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
                        margin:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text("Rs.200"),
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
                              "Make Payayment",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 18),
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
                                onPressed: () {},
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
                                onPressed: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: backgroundWhite, fontSize: 18),
                                ))),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
