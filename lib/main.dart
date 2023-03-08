import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constant/colors.dart';
import 'Modal/service_modal.dart';
import 'Screen/services.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServicesNotifier(),
      child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            appBarTheme: const AppBarTheme(color: kPrimaryColor),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomePage()),
    );
  }
}
