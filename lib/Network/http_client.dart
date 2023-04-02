import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeServiceHttpClient {
  final client = http.Client();

  Future get({required String url}) async {
    try {
      debugPrint("http called$url");
      final response = await client.get(
        Uri.parse(url),
        headers: header(),
      );

      log("Status code ${response.statusCode}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      if (response.statusCode == 409) {
        throw Exception(jsonDecode(response.body)['message']);
      }
      throw Exception("error occured ${response.reasonPhrase}");
    } on Exception catch (e) {
      debugPrint("exception occured$e");
      rethrow;
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      debugPrint("http called");
      final response = await client.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header(),
      );

      log("Status code ${response.statusCode}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      if (response.statusCode == 409) {
        throw Exception(jsonDecode(response.body)['message']);
      }
      throw Exception("error occured ${response.reasonPhrase}");
    } on Exception {
      debugPrint("exception occured");
      rethrow;
    }
  }

  Map<String, String> header() {
    return {'content-type': 'application/json'};
  }
}
