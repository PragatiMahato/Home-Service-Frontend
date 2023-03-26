// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:image_picker/image_picker.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            children: const [
              ProfileRow(
                name: 'Name',
                picon: Icon(Icons.person),
              ),
              ProfileRow(
                name: 'Phone',
                picon: Icon(Icons.call),
              ),
              ProfileRow(
                name: 'Address',
                picon: Icon(Icons.location_on),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage("assets/images/pp.png"),
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
  late PickedFile imageFile;
  final ImagePicker _picker = ImagePicker();
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
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera")),
              const SizedBox(
                width: 20,
              ),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("from Gallery"))
            ],
          ),
        )
      ]),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.name,
    required this.picon,
    this.onpress,
  });
  final String name;
  final Icon picon;
  final Callback? onpress;

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
