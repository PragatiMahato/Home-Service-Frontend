import 'package:flutter_test/flutter_test.dart';
import 'package:fyp/Network/api_response.dart';
import 'package:fyp/Provider/login_provider.dart';
import 'package:fyp/model/service_modal.dart';
import 'package:fyp/model/usermodel.dart';
import 'package:fyp/services/authservice.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserLoginModel> login(
      {required String email, required String password}) async {
    // Mock the login response here
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'pass@gmail.com') {
      return UserLoginModel(
        id: "123",
        email: email,
        password: password,
        name: "abc",
      );
    }
    throw Exception("Something went wrong");
  }

  @override
  Future<List<ServiceType>> searchPosts({required String keyword}) {
    throw UnimplementedError();
  }

  @override
  Future signUp(
      {required String email, required String password, required String name}) {
    throw UnimplementedError();
  }
}

void main() {
  group('LoginProvider', () {
    late LoginProvider loginProvider;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      loginProvider = LoginProvider(authService: mockAuthService);
    });

    test(
        'login() should set loginResponse to ApiResponse.success on successful login',
        () async {
      const email = 'pass@gmail.com';
      const password = 'password';

      await loginProvider.login(email: email, password: password);

      expect(loginProvider.loginResponse.status, equals(Status.success));
      expect(loginProvider.loginResponse.data, isA<UserLoginModel>());
      expect(loginProvider.loginResponse.error, isNull);
    });

    test(
        'login() should set loginResponse to ApiResponse.error on failed login',
        () async {
      const email = 'fail@example.com';
      const password = 'wrong_password';

      await loginProvider.login(email: email, password: password);

      expect(loginProvider.loginResponse.status, equals(Status.error));
      expect(loginProvider.loginResponse.data, isNull);
      expect(loginProvider.loginResponse.error, isNotNull);
    });
  });
}
