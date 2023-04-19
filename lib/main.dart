import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constant/app_colors.dart';
import 'Network/http_client.dart';
import 'Provider/getservice_provider.dart';
import 'Provider/login_provider.dart';
import 'Provider/searchprovider.dart';
import 'Provider/signup_provider.dart';
import 'Screen/splash.dart';
import 'services/authservice.dart';
import 'services/getservice.dart';

void main() async {
  final HomeServiceHttpClient httpClient = HomeServiceHttpClient();
  final AuthService authService = AuthService(client: httpClient);
  final GetService getService = GetService(client: httpClient);
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp(
    authService: authService,
    getService: getService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.authService,
      required this.getService,});
  final AuthService authService;
  final GetService getService;


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
            home: const SplashScreen()));
  }
}
