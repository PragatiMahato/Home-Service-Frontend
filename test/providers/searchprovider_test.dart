import 'package:flutter_test/flutter_test.dart';
import 'package:fyp/Network/api_response.dart';
import 'package:fyp/Provider/searchprovider.dart';
import 'package:fyp/model/service_modal.dart';
import 'package:fyp/model/usermodel.dart';
import 'package:fyp/services/authservice.dart';

class MockSearchService implements AuthService {
  @override
  Future<List<ServiceType>> searchPosts({required String keyword}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (keyword == 'service') {
      return [
        ServiceType(
          id: '1',
          about: 'Test Service 1',
          icon: 'icon1',
          image_url: 'https://image1.com',
          service_type: 'Type 1',
          subTypes: [],
        )
      ];
    } else if (keyword == 'service1') {
      return [
        ServiceType(
          id: '2',
          about: 'Test Service 2',
          icon: 'icon2',
          image_url: 'https://image2.com',
          service_type: 'Type 2',
          subTypes: [],
        )
      ];
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<UserLoginModel> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future signUp({required String email, required String password, required String name}) {
    throw UnimplementedError();
  }
}

void main() {
  group('SearchProvider', () {
    late SearchProvider searchProvider;
    late MockSearchService mockSearchService;

    setUp(() {
      mockSearchService = MockSearchService();
      searchProvider = SearchProvider(authService: mockSearchService);
    });

    test(
        'searchPosts() should set getSearchResponse to ApiResponse.success with List<ServiceType> data on successful search',
        () async {
      const keyword = 'service';

      await searchProvider.searchPosts(keyword: keyword);

      expect(searchProvider.getSearchResponse.status, equals(Status.success));
      expect(searchProvider.getSearchResponse.data, isA<List<ServiceType>>());
      expect(searchProvider.getSearchResponse.data?.length, equals(1));
      expect(searchProvider.getSearchResponse.data?[0].id, equals('1'));
      expect(searchProvider.getSearchResponse.error, isNull);
    });

    test(
        'searchPosts() should set getSearchResponse to ApiResponse.success with List<ServiceType> data on successful search',
        () async {
      const keyword = 'service1';

      await searchProvider.searchPosts(keyword: keyword);

      expect(searchProvider.getSearchResponse.status, equals(Status.success));
      expect(searchProvider.getSearchResponse.data, isA<List<ServiceType>>());
      expect(searchProvider.getSearchResponse.data?.length, equals(1));
      expect(searchProvider.getSearchResponse.data?[0].id, equals('2'));
      expect(searchProvider.getSearchResponse.error, isNull);
    });

    test(
        'searchPosts() should set getSearchResponse to ApiResponse.error on failed search',
        () async {
      const keyword = 'service2';

      await searchProvider.searchPosts(keyword: keyword);

      expect(searchProvider.getSearchResponse.status, equals(Status.error));
      expect(searchProvider.getSearchResponse.data, isNull);
      expect(searchProvider.getSearchResponse.error, isNotNull);
    });
  });
}
