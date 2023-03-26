import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant/app_size.dart';
import '../Provider/booking_provider.dart';

class MyBookingHistory extends StatefulWidget {
  const MyBookingHistory({super.key});

  @override
  State<MyBookingHistory> createState() => _MyBookingHistoryState();
}

class _MyBookingHistoryState extends State<MyBookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
        iconTheme: const IconThemeData(),
      ),
      body:
          Consumer<BookingNotifier>(builder: (context, bookingNotifier, child) {
        return ListView.builder(
          itemCount: bookingNotifier.booking.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 4),
              color: const Color.fromARGB(255, 239, 236, 255),
              padding: const EdgeInsets.all(AppSize.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingNotifier.booking[index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          bookingNotifier.booking[index].date,
                        ),
                        Text(
                          bookingNotifier.booking[index].location,
                        ),
                        Text(
                          bookingNotifier.booking[index].total_price,
                        ),
                      ]),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(top: 0),
                    child: IconButton(
                        onPressed: () {
                          bookingNotifier
                              .removeNote(bookingNotifier.booking[index]);
                        },
                        icon: const Icon(Icons.delete)),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
