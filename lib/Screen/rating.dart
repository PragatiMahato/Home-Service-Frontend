// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import '../Constant/colors.dart';
import '../Network/api_const.dart';

class RatingScreen extends StatelessWidget {
  final String serviceId;

  const RatingScreen({super.key, required this.serviceId});

  final double _initialRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Transform.scale(
              scale: 0.65,
              child: const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            onRatingUpdate: (rating) => debugPrint(rating.toString()),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              postRating(serviceId, _initialRating);
            },
            child: const Text(
              ' Rate us',
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
        print('Rating submitted successfully');
      } else {
        print('Failed to submit rating. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred while submitting the rating: $error');
    }
  }
}
