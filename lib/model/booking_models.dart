// ignore_for_file: non_constant_identifier_names

import 'package:fyp/model/usermodel.dart';

class BookingDetails {
  UserLoginModel user;
  String location;
  String date;
  String price_rate;

final int subTypeId;

  BookingDetails({
    required this.user,
    required this.location,
    required this.date,
    required this.subTypeId,
    required this.price_rate,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
        user: UserLoginModel.fromJson(json['user']),
        subTypeId: json['sub_type']['id'], 
        date: json['date'],
        price_rate: json['price_rate'],
        location: json['location']);
  }
  static List<BookingDetails> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BookingDetails.fromJson(json)).toList();
  }
}
