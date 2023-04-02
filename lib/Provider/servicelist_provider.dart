// import 'package:flutter/material.dart';

// import '../Network/api_response.dart';
// import '../services/authservice.dart';

// class GetServiceProvider with ChangeNotifier{
//   late final AuthService _authService;

//     GetServiceProvider({required AuthService authService}) {
//     _authService = authService;
//   }
//   ApiResponse<void> apiResponse = ApiResponse.loading();

//   Future<void> posts({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     try {
//       await _authService.signUp(
//         email: email,
//         password: password,
//         name:name,
//       );

//       apiResponse = ApiResponse.success(null);
//       notifyListeners();
//     } catch (e) {
//       apiResponse = ApiResponse.error(e.toString());
//       notifyListeners();
//     }
//   }
// }