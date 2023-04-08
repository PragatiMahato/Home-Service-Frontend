// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class PhoneNumber extends StatelessWidget {
  final String phoneNumber = "+1234567890"; // Replace with the phone number you want to call

  // Launch phone dialer with the phone number
  void _launchPhoneDialer() async {
  String url = "tel:${9825838184}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch phone dialer';
  }
}


  // Launch Truecaller app with the phone number
  void _launchTruecaller() async {
    String url = "tel:${9825838184}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch Truecaller';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Dialer and Truecaller Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _launchPhoneDialer,
              child: Text('Open Phone Dialer'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchTruecaller,
              child: Text('Open Truecaller'),
            ),
          ],
        ),
      ),
    );
  }
}
