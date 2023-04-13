// ignore_for_file: implementation_imports, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:fyp/Provider/login_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Network/api_const.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key, required this.userId});
  final String userId;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _messageController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    const url = '${ApiConst.baseUrl}feedback';
    final response = await http.post(Uri.parse(url), body: {
      'userId': context.read<LoginProvider>().loginResponse.data!.id,
      'feedback': _messageController.text,
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback added successfully')),
      );

      _messageController.clear();
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding feedback')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSize.s30 * 2),
        child: Column(
          children: [
            const Text(
              "Send us your feedback!",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                margin: const EdgeInsets.only(right: AppSize.s30 * 5.2),
                child: const Text(
                  "How was your experience?",
                  style: TextStyle(fontSize: 16),
                )),
            Container(
              height: 190,
              color: const Color.fromARGB(255, 235, 235, 235),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Describe your experience",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 63,
                    ),
                    TextFormField(
                      controller: _messageController,
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please give your feedback';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                        hintText: 'Enter your text here',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState != null && _formkey.currentState!.validate()) {
          _submitFeedback();
        }
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
