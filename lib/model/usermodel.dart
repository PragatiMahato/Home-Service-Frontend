class Usermodel {
  String email;
  String password;
  String name;
  String createdAt;

  Usermodel({required this.email, required this.password, required this.name,required this.createdAt});

  factory Usermodel.fromJson(Map<String, dynamic> map) {
    return Usermodel(
      createdAt: map['createdAt'],
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