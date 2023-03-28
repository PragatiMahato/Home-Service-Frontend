import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constant/colors.dart';
import 'Network/http_client.dart';
import 'Provider/booking_provider.dart';
import 'Provider/login_provider.dart';
import 'Provider/signup_provider.dart';
import 'Screen/account.dart';
import 'services/authservice.dart';

void main() async {
  final HomeServiceHttpClient httpClient = HomeServiceHttpClient();
  final AuthService authService = AuthService(client: httpClient);
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authService});
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignUpProvider>(
              create: (context) => SignUpProvider(authService: authService)),
          ChangeNotifierProvider<LoginProvider>(
              create: (context) => LoginProvider(authService: authService)),
          ChangeNotifierProvider<BookingNotifier>(
              create: (context) => BookingNotifier())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.system,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              appBarTheme: const AppBarTheme(color: kPrimaryColor),
            ),
            debugShowCheckedModeBanner: false,
            // home: Booking(address: '',)),
            // home:  const FeedbackScreen(userId: '6408722c78393a6fb6ab76fe',)
            home: MyAccount(),
            ));
  }
}
