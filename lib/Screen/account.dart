import 'package:flutter/material.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';
import 'feedback.dart';
import 'help_center.dart';
import 'login.dart';
import 'profile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: AppSize.s30, top: AppSize.s30, right: AppSize.s30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "General",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ProfileScreen();
                      }));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 33,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "My Profile",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ProfileScreen();
                      }));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.map,
                          size: 33,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 20,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: AppSize.s30, top: AppSize.s30, right: AppSize.s30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Support",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HelpCenter();
                      }));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.help_center,
                          size: 33,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Help Center",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const FeedbackScreen(
                          userId: '6408722c78393a6fb6ab76fe',
                        );
                      }));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.feedback,
                          size: 33,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Feedback",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 20,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.s30, vertical: AppSize.s20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Logout '),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Logout'),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const LoginScreen();
                                    }));
                                    // deleteUser(user['_id']);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
