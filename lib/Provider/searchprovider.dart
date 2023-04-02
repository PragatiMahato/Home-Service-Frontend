import 'package:flutter/material.dart';

import '../Network/api_response.dart';
import '../model/service_modal.dart';
import '../services/authservice.dart';

class SearchProvider with ChangeNotifier {
  late final AuthService _authService;

  SearchProvider({required AuthService authService}) {
    _authService = authService;
  }

  ApiResponse<List<ServiceType>> getSearchResponse = ApiResponse.loading();

  Future<void> searchPosts({required String keyword}) async {
    try {
      final response = await _authService.searchPosts(keyword: keyword);
      getSearchResponse = ApiResponse.success(response);
      notifyListeners();
    } on Exception {
      getSearchResponse = ApiResponse.error("something went wrong");
      notifyListeners();
    }
  }
}
