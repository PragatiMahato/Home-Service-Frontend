import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyOtpPage extends StatefulWidget {
  final String phone;

  VerifyOtpPage({required this.phone});

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  String _message = '';

  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:5001/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': widget.phone,
          'otp': _otpController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        // Do something with token
      } else {
        final responseData = json.decode(response.body);
        _message = responseData['message'];
      }
    } catch (err) {
      print(err);
      _message = 'Internal server error';
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'OTP'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:(){
_isLoading ? null : _verifyOtp;
                //  Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return HomePage();
                // }));
              } ,
              child: Text(_isLoading ? 'Verifying...' : 'Verify'),
            ),
            SizedBox(height: 16.0),
            Text(
              _message,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
