import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

enum Gender {
  male,
  female,
}

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
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
    final gender = _gender.toString().split('.').last;
    final color = _colorController.text;
    final description = _descriptionController.text;
    final category = _categoryController.text;

    final bytes = await _imageFile!.readAsBytes();

    final uri = Uri.parse('http://192.168.1.128:3000/services');
    final request = http.MultipartRequest('POST', uri);

    request.fields['name'] = name;
    request.fields['gender'] = gender;
    request.fields['color'] = color;
    request.fields['description'] = description;
    request.fields['category'] = category;

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      bytes,
      filename: _imageFile!.path.split('/').last,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pet added successfully.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pet addition failed.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
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
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Male'),
                const SizedBox(width: 24),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(
                labelText: 'Color',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
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
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                    ),
                    child: const Text('Choose Image'),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 16.0),
                      Image.network(
                        _imageFile!.path,
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
                    backgroundColor: MaterialStateProperty.all(Colors.brown),
                  ),
                  child: const Text('Post'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}