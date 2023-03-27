// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import '../Network/api_const.dart';
import '../Provider/booking_provider.dart';
import '../model/booking_models.dart';
import 'map.dart';
import 'mybooking_history.dart';
import 'services.dart';

// const List<String> list = <String>[
//   'Esewa',
//   'Khalti',
// ];

class Booking extends StatefulWidget {
  const Booking({super.key, required this.address});
  final String address;

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
      backgroundColor: const Color.fromARGB(255, 192, 182, 246),
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
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "House Cleaning",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      const Text("Rs.200/hr"),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => Transform.scale(
                          scale: 0.6,
                          child: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (rating) =>
                            debugPrint(rating.toString()),
                      ),
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
