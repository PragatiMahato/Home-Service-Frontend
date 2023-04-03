// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constant/app_size.dart';
import '../Network/api_const.dart';
import '../model/userprofile.dart';
import 'map.dart';
import 'profilepage.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final List<UserProfile> _userProfiles = [];

  Future<void> _postUserProfile() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('${ApiConst.baseUrl}userprofile'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text,
          'phone': _phoneController.text,
          'address': _addressController.text,
        }),
      );

      if (response.statusCode == 200) {
        _nameController.clear();
        _phoneController.clear();
        _addressController.clear();
      } else if (response.statusCode == 409) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('User already exists'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        throw Exception('Failed to add user profile');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profiles'),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a phone number';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              labelText: 'Address',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const MapSample();
                                    }));
                                  },
                                  icon: const Icon(Icons.location_on))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'set current address';
                            }
                            return null;
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              _postUserProfile().then((value) =>
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const UserProfileScreen();
                                  })));
                            },
                            child: const Text("Add"))
                      ])))
        ]));
  }
}
