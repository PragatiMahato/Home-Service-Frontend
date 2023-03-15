class Usermodel {
  String email;
  String password;

  Usermodel({required this.email, required this.password});

  factory Usermodel.fromJson(Map<String, dynamic> map) {
    return Usermodel(email: map['email'], password: map['password']);
  }
}
