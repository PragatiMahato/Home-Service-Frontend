import 'package:flutter/material.dart';

import '../Network/api_response.dart';
import '../model/usermodel.dart';
import '../services/authservice.dart';


class LoginProvider with ChangeNotifier {
  LoginProvider({required AuthService authService}) {
    _authService = authService;
  }

  late final AuthService _authService;

  ApiResponse<UserLoginModel> loginResponse = ApiResponse.loading();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await _authService.login(email: email, password: password);

      loginResponse = ApiResponse.success(response);
      notifyListeners();
    } catch (e) {
      loginResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}