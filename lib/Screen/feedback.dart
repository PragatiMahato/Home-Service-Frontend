// ignore_for_file: implementation_imports, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key, required this.userId});
  final String userId;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _messageController = TextEditingController();

  void _submitFeedback() async {
    final response = await http.post(
      Uri.parse('${ApiConst.baseUrl}userFeedback/${widget.userId}/feedback'),
      body: {'feedback': _messageController.text},
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Feedback submitted successfully'),
        ),
      );
      _messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to submit feedback'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Feedback"),
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
                  "How was you experience?",
                  style: TextStyle(fontSize: 16),
                )),
            Container(
              height: 160,
              color: const Color.fromARGB(255, 235, 235, 235),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Describe your exprience",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor),
                  ),
                  const SizedBox(
                    height: 74,
                  ),
                  TextField(
                    controller: _messageController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      hintText: 'Enter your text here',
                      hintStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 51, 51, 51)),
                      contentPadding: EdgeInsets.only(bottom: 8.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: kPrimaryColor),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _submitFeedback();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, color: backgroundWhite),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
