import 'dart:convert';

import 'package:http/http.dart' as http;

class ServiceModel {
  String id;
  String name;
  String type;
  String description;
  String image;
  int price;

  ServiceModel(
      {required this.id,
      required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.type});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
      );
}

class Services {
  List<ServiceModel> service = [];

  Future<void> getService() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=bbe2798bef0d44eab0b9a83485a8e4c3";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ServiceModel article = ServiceModel(
            id: element['id'],
            name: element['name'],
            image: element['image'],
            type: element['type'],
            price: element['price'],
            description: element['description'],
          );
          service.add(article);
        }
      });
    }
  }
}
