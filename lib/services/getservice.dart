// ignore_for_file: non_constant_identifier_names

import '../Network/api_const.dart';
import '../Network/http_client.dart';
import '../model/service_modal.dart';

class GetService {
  late final HomeServiceHttpClient _client;

  GetService({required HomeServiceHttpClient client}) {
    _client = client;
  }

  Future<List<ServiceType>> getServiceTypes() async {

    final response = await _client.get(url: '${ApiConst.baseUrl}posts');
    return (response as List<dynamic>)
        .map((e) => ServiceType.fromJson(e as Map<String, dynamic>))
        .toList();
    
      
  }
}
