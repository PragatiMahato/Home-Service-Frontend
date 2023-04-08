import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model class for booking data
class BookingData {
  String name;
  String date;
  String location;
  int totalPrice;
  String serviceId;

  BookingData({
    required this.name,
    required this.date,
    required this.location,
    required this.totalPrice,
    required this.serviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'location': location,
      'total_price': totalPrice,
      'serviceId': serviceId,
    };
  }
}

// API endpoint for booking a service
final String bookingEndpoint = 'http://localhost:3000/bookService/';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String date;
  late String location;
  late int totalPrice;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Create booking data object
      BookingData bookingData = BookingData(
        name: name,
        date: date,
        location: location,
        totalPrice: totalPrice,
        serviceId: '123', // Replace with the actual service ID
      );

      // Convert booking data object to JSON
      String jsonData = jsonEncode(bookingData.toJson());

      // Make API request to book service
      try {
        final response = await http.post(
          Uri.parse(bookingEndpoint + bookingData.serviceId + '/booking'),
          headers: {'Content-Type': 'application/json'},
          body: jsonData,
        );

        if (response.statusCode == 201) {
          // Booking was successful
          print('Booking successful!');
          // Perform any necessary UI actions, such as showing a success message
        } else {
          // Booking failed
          print('Booking failed: ${response.body}');
          // Perform any necessary UI actions, such as showing an error message
        }
      } catch (error) {
        print('Error booking service: $error');
        // Perform any necessary UI actions, such as showing an error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Service')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
                onSaved: (value) => date = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) => location = value!,
             
  ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Total Price'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a total price';
            }
            return null;
          },
          onSaved: (value) => totalPrice = int.parse(value!),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text('Book Service'),
        ),
      ],
    ),
  ),)
);
}
}




