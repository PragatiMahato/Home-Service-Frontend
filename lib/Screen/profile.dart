// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _nickname = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("Profile"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const ProfileImage(),
          Column(
            children: [
              ProfileRow(
                name: 'NickName$_nickname',
                picon: Icon(Icons.person),
                onpress: () {
                  _editNickname();
                },
              ),
              // ProfileRow(
              //   name: 'Phone',
              //   picon: Icon(Icons.call),
              // ),
              // ProfileRow(
              //   name: 'Address',
              //   picon: Icon(Icons.location_on),
              // )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  late String _imagePath = '';
  String _nickname = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nickname = prefs.getString('nickname') ?? 'Guest';
      _imagePath = prefs.getString('imagePath') ?? '';
    });
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: _imagePath.isNotEmpty
              ? FileImage(File(_imagePath))
              : const AssetImage('assets/images/pp.png')
                  as ImageProvider<Object>,
        ),
        Positioned(
            bottom: 1,
            right: 1,
            top: 85,
            left: 80,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => const BottomSheet()));
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: kPrimaryColor,
                  size: 39,
                )))
      ],
    );
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  late String _imagePath = '';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.getScreenWidth(context),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: AppSize.getScreenHeight(context) * 0.15,
      child: Column(children: [
        const Text(
          "Choose image from",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: AppSize.s30 * 2),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    // takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera")),
              const SizedBox(
                width: 20,
              ),
              TextButton.icon(
                  onPressed: () {
                    _selectImage();
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallary")),
            ],
          ),
        )
      ]),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.name,
    required this.picon,
    required this.onpress,
  });
  final String name;
  final Icon picon;
  final Callback onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppSize.globalSymetricmargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              picon,
              Column(
                children: [
                  Padding(
                    padding: AppSize.globalSymetricpadding,
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: onpress,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
