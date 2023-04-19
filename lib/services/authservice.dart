// ignore_for_file: unused_local_variable, avoid_print

import 'package:fyp/Network/api_const.dart';

import '../Network/http_client.dart';
import '../model/service_modal.dart';
import '../model/usermodel.dart';

class AuthService {
  late final HomeServiceHttpClient _client;

  AuthService({required HomeServiceHttpClient client}) {
    _client = client;
  }

  Future<UserLoginModel> login(
      {required String email, required String password}) async {
    final response = await _client.post(url: "${ApiConst.baseUrl}login", body: {
      'email': email,
      'password': password,
    });
    print(response);

    return UserLoginModel.fromJson((response as Map<String, dynamic>));
  }

  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    final response =
        await _client.post(url: "${ApiConst.baseUrl}signup", body: {
      'email': email,
      'password': password,
      'name': name,
    });
  }

  Future<List<ServiceType>> searchPosts({required String keyword}) async {
    final response = await _client.get(
        url: '${ApiConst.baseUrl}searchByType?keyword=$keyword');

    return (response as List<dynamic>)
        .map((e) => ServiceType.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
