// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/Network/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

enum Gender {
  male,
  female,
}

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _nameController = TextEditingController();
  Gender? _gender;
  final _colorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  File? _imageFile;

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _addPet() async {
    if (_nameController.text.isEmpty ||
        _gender == null ||
        _colorController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _categoryController.text.isEmpty ||
        _imageFile == null) {
      // If any required field is empty, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all the required fields.'),
        ),
      );
      return;
    }

    final name = _nameController.text;
    final about = _descriptionController.text;

    final bytes = await _imageFile!.readAsBytes();

    final uri = Uri.parse('${ApiConst.baseUrl}services');
    final request = http.MultipartRequest('POST', uri);

    request.fields['name'] = name;
    request.fields['about'] = about;

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      bytes,
      filename: _imageFile!.path.split('/').last,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('services added successfully.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('services addition failed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(
                labelText: 'About',
              ),
            ),
            const SizedBox(height: 8.0),
            _imageFile == null
                ? ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile == null) return;

                      setState(() {
                        _imageFile = File(pickedFile.path);
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                    ),
                    child: const Text('Select Image'),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 16.0),
                      Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: 200.0,
                      ),
                    ],
                  ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addPet,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                  ),
                  child: const Text('Add Service'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
