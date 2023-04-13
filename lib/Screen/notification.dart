import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120,),
            Image.network(
                "https://cdn.dribbble.com/users/1373705/screenshots/6457914/no_notification_yiran.png?compress=1&resize=400x300"),
            const Text("No new notification")
          ],
        ),
      ),
    );
  }
}
