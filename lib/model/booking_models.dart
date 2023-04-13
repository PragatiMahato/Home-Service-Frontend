// ignore_for_file: non_constant_identifier_names

import 'package:fyp/model/usermodel.dart';

class BookingDetails {
  UserLoginModel user;
  String location;
  String date;
  String price_rate;

  String subtypeId;

  BookingDetails({
    required this.user,
    required this.location,
    required this.date,
    required this.subtypeId,
    required this.price_rate,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
        user: UserLoginModel.fromJson(json['user']),
        subtypeId: json['_id'],
        date: json['date'],
        price_rate: json['price_rate'],
        location: json['location']);
  }
}
