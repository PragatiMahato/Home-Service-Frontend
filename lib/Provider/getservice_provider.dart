import 'package:flutter/material.dart';

import '../Network/api_response.dart';
import '../model/service_modal.dart';
import '../services/getservice.dart';

class GetServiceProvider with ChangeNotifier {
  late final GetService _getService;

  GetServiceProvider({required GetService getService}) {
    _getService = getService;
  }

  ApiResponse<List<ServiceType>> getServiceResponse = ApiResponse.loading();

  Future<void> getServiceTypes() async {
    try {
      final response = await _getService.getServiceTypes();
      getServiceResponse = ApiResponse.success(response);
      notifyListeners();
    } on Exception catch (e) {
      print("$e");
      getServiceResponse = ApiResponse.error("something went wrong");
      notifyListeners();
    }
  }
}
