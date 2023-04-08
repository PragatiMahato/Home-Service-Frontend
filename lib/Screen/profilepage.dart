import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/app_size.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String _nickname = '';
  String _phone = '';
  String _address = '';
  late String _imagePath = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nickname = prefs.getString('nickname') ?? 'Guest';
      _phone = prefs.getString('phone') ?? 'Guest';
      _address = prefs.getString('address') ?? 'Guest';
      _imagePath = prefs.getString('imagePath') ?? '';
    });
  }

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', pickedFile.path);
    }
  }

  Future<void> _editNickname() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: _nickname);
        return AlertDialog(
          title: const Text('Edit Nickname'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _nickname = result;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('nickname', result);
    }
  }

  Future<void> _editphone() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        final phonecontroller = TextEditingController(text: _phone);
        return AlertDialog(
          title: const Text('Edit Number'),
          content: TextField(controller: phonecontroller),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(phonecontroller.text);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _phone = result;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', result);
    }
  }

  Future<void> _editAddress() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        final addresscontroller = TextEditingController(text: _address);
        return AlertDialog(
          title: const Text('Edit Address'),
          content: TextField(controller: addresscontroller),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(addresscontroller.text);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _address = result;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('address', result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(children: [
              Container(height: 100,width: 100,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _imagePath.isNotEmpty
                      ? FileImage(File(_imagePath))
                      : const AssetImage('assets/images/pp.png')
                          as ImageProvider<Object>,
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                top: 85,
                left: 80,
                child: InkWell(
                  onDoubleTap: _selectImage,
                  child:  Icon(Icons.camera_alt),
                )
              )
            ]),
            const SizedBox(height: 16),
            Container(
      margin: AppSize.globalSymetricmargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              Column(
                children: [
                  Padding(
                    padding: AppSize.globalSymetricpadding,
                    child: Text(
                      'Nickname: $_nickname',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: _editNickname,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
      ),
    ),
    Divider(),
     Container(
      margin: AppSize.globalSymetricmargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.call),
              Column(
                children: [
                  Padding(
                    padding: AppSize.globalSymetricpadding,
                    child: Text(
                      ' $_phone',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: _editphone,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
      ),
    ),
    Divider(),
     Container(
      margin: AppSize.globalSymetricmargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              Column(
                children: [
                  Padding(
                    padding: AppSize.globalSymetricpadding,
                    child: Text(
                      ' $_address',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: _editAddress,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
      ),
    )
          
          ],
        ),
      ),
    );
  }
}
