// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import '../Constant/colors.dart';
import '../Network/api_const.dart';

class RatingScreen extends StatelessWidget {
  final String serviceId;

   RatingScreen({Key? key, required this.serviceId}) : super(key: key);

  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => _rating = rating,
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () {
              postRating(serviceId, _rating);
            },
            child: const Text(
              'Rate us',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> postRating(String serviceId, double rating) async {
    final url = Uri.parse('${ApiConst.baseUrl}services/$serviceId/ratings');
    try {
      final response = await http.post(
        url,
        body: {'rating': rating.toString()},
      );

      if (response.statusCode == 201) {
        debugPrint('Rating submitted successfully');
      } else {
        debugPrint('Failed to submit rating. Status code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('An error occurred while submitting the rating: $error');
    }
  }
}
