import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constant/colors.dart';
import 'Network/http_client.dart';
import 'Provider/getservice_provider.dart';
import 'Provider/login_provider.dart';
import 'Provider/searchprovider.dart';
import 'Provider/signup_provider.dart';
import 'Screen/profilepage.dart';
import 'model/service_modal.dart';
import 'services/authservice.dart';
import 'services/getservice.dart';

void main() async {
  final HomeServiceHttpClient httpClient = HomeServiceHttpClient();
  final AuthService authService = AuthService(client: httpClient);
  final GetService getService = GetService(client: httpClient);
  final SubType subType =
      SubType(image: '', name: '', description: '', price_rate: '');
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp(
    authService: authService,
    getService: getService,
    subType: subType,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.authService,
      required this.getService,
      required this.subType});
  final AuthService authService;
  final GetService getService;
  final SubType subType;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignUpProvider>(
              create: (context) => SignUpProvider(authService: authService)),
          ChangeNotifierProvider<LoginProvider>(
              create: (context) => LoginProvider(authService: authService)),
          ChangeNotifierProvider<SearchProvider>(
              create: (context) => SearchProvider(authService: authService)),
          ChangeNotifierProvider<GetServiceProvider>(
              create: (context) => GetServiceProvider(getService: getService))
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
            // home: const FeedbackScreen(
            //   userId: '6408722c78393a6fb6ab76fe',
            // )));
            // home:  RatingScreen(serviceId: '6421c4e17af5ab7923f3867e',),
            // home: BottomNavBar(
            //   subType: subType,
            // )));
            home: UserProfile()));
  }
}
