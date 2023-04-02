class Usermodel {
  String email;
  String password;
  String? name;


  Usermodel({required this.email, required this.password,  this.name});

  factory Usermodel.fromJson(Map<String, dynamic> map) {
    return Usermodel(
        email: map['email'], password: map['password'], name: map['name']);
  }
}

class UserLoginModel {
  String email;
  String password;


  UserLoginModel({required this.email, required this.password, });

  factory UserLoginModel.fromJson(Map<String, dynamic> map) {
    return UserLoginModel(
        email: map['email'], password: map['password'], );
  }
}