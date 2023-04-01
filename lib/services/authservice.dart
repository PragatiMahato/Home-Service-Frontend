// ignore_for_file: unused_local_variable

import 'package:fyp/Network/api_const.dart';

import '../Network/http_client.dart';
import '../model/usermodel.dart';

class AuthService {
  late final HomeServiceHttpClient _client;

  AuthService({required HomeServiceHttpClient client}) {
    _client = client;
  }

  Future<Usermodel> login(
      {required String email, required String password}) async {
    final response = await _client.post(url: "${ApiConst.baseUrl}logIn", body: {
      'email': email,
      'password': password,
    });
    // print(response);

    return Usermodel.fromJson((response as Map<String, dynamic>)['user']);
  }

  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    final response =
        await _client.post(url: "${ApiConst.baseUrl}signUp", body: {
      'email': email,
      'password': password,
      'name': name,
    });

    // print("resposne is $response");
  }
}
