class ServiceType {
  final String about;
  // final String icon;
  final String image_url;
  final String service_type;
  final List<SubType> subTypes;

  ServiceType(
      {required this.about,
      // required this.icon,
      required this.image_url,
      required this.service_type,
      required this.subTypes});

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    List<SubType> subTypesList = [];
    for (var subType in json['sub_types']) {
      subTypesList.add(SubType.fromJson(subType));
    }
    return ServiceType(
      // icon: json['icons'],
      image_url: json['image_url'],
      about: json['about'],
      service_type: json['service_type'],
      subTypes: subTypesList,
    );
  }
}

class SubType {
  final String image;
  final String name;
  final String description;
  final double Rate;
  final String price_rate;

  SubType({
    required this.image,
    required this.name,
    required this.description,
    required this.Rate,
    required this.price_rate,
  });

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      Rate: json['Rate'],
      description: json['description'],
      price_rate: json['price_rate'],
      image: json['image'],
      name: json['name'],
    );
  }
}