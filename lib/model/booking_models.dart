// ignore_for_file: non_constant_identifier_names

class BookingDetails {
  String name;
  String location;
  String date;
  String price_rate;

  String serviceId;

  BookingDetails(
      {required this.name,
      required this.location,
      required this.date,
      required this.serviceId,
      required this.price_rate,
});


factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      name: json['name'],
      serviceId: json['_id'],
      date: json['date'],
      price_rate: json['price_rate'],
      location: json['location']
    );
  }
}

