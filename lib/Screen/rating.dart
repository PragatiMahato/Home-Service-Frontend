// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _rating = 0;

  Future<void> _submitRating() async {
    const serviceId = '6419780b5db89c94d11ab232'; // Replace with your service ID
    final url = Uri.parse('${ApiConst.baseUrl}services/$serviceId/ratings');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'rating': _rating}),
      );

      if (response.statusCode == 201) {
        // Rating successfully submitted
        print('Rating submitted successfully');
      } else {
        // Rating submission failed
        print('Failed to submit rating. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // An error occurred while submitting the rating
      print('An error occurred while submitting the rating: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate our Service'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Please rate our service:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 48.0,
                icon: const Icon(Icons.star_border),
                onPressed: () => setState(() => _rating = 1),
              ),
              IconButton(
                iconSize: 48.0,
                icon: const Icon(Icons.star_border),
                onPressed: () => setState(() => _rating = 2),
              ),
              IconButton(
                iconSize: 48.0,
                icon: const Icon(Icons.star_border),
                onPressed: () => setState(() => _rating = 3),
              ),
              IconButton(
                iconSize: 48.0,
                icon: const Icon(Icons.star_border),
                onPressed: () => setState(() => _rating = 4),
              ),
              IconButton(
                iconSize: 48.0,
                icon: const Icon(Icons.star_border),
                onPressed: () => setState(() => _rating = 5),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitRating,
            child: const Text('Submit Rating'),
          ),
        ],
      ),
    );
  }
}