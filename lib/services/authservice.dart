

import '../Network/http_client.dart';
import '../model/usermodel.dart';

class AuthService {
  late final HomeServiceHttpClient _client;

  AuthService({required HomeServiceHttpClient client}) {
    _client = client;
  }

  Future<Usermodel> login(
      {required String email, required String password}) async {
    final response =
        await _client.post(url: "http://localhost/logIn", body: {
      'email': email,
      'password': password,
    });

    return Usermodel.fromJson(response);
  }

  Future signUp({required String email, required String password}) async {
    final response =
        await _client.post(url: "http://localhost:3000/signUp", body: {
      'email': email,
      'password': password,
    });

    print("resposne is $response");
  }
}