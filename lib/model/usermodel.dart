// ignore_for_file: avoid_print

class Usermodel {
  String email;
  String password;
  String? name;

  Usermodel({required this.email, required this.password, this.name});

  factory Usermodel.fromJson(Map<String, dynamic> map) {
    return Usermodel(
        email: map['email'], password: map['password'], name: map['name']);
  }
}

class UserLoginModel {
  String id;
  String email;
  String password;
  String name;

  UserLoginModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.name});

  factory UserLoginModel.fromJson(Map<String, dynamic> map) {
    print(map);
    return UserLoginModel(
      name: map['name'],
      id: map['_id'],
      email: map['email'],
      password: map['password'],
    );
  }
}
