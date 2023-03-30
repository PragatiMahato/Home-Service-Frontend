class Usermodel {
  String email;
  String password;
  String name;

  Usermodel({required this.email, required this.password, required this.name});

  factory Usermodel.fromJson(Map<String, dynamic> map) {
    return Usermodel(
        email: map['email'], password: map['password'], name: map['name']);
  }
}
