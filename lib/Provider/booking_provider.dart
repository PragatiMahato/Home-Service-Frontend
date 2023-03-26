import 'package:flutter/cupertino.dart';

import '../model/booking_models.dart';


class BookingNotifier extends ChangeNotifier {
  final List<BookingDetails> _booking = [];

  List<BookingDetails> get booking => _booking;

  void addNote(BookingDetails bookingDetails) {
    _booking.add(bookingDetails);
    notifyListeners();
  }

   void removeNote(BookingDetails bookingDetails) {
    _booking.removeWhere((item) => item.id == bookingDetails.id);
    notifyListeners();
  }
}