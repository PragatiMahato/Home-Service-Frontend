// ignore_for_file: implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Constant/colors.dart';
import 'package:fyp/CustomWidget/button.dart';
import 'package:fyp/Screen/services.dart';
import 'package:provider/provider.dart';

import '../Modal/service_modal.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  late final TextEditingController _titleController;
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _titleController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Add Service"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                hintText: "Price",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
          ),
         RoundedButton(title: "Add", callback: (){
          Services service = Services(
                      title: _titleController.text,
                      name: _titleController.text,
                      price: _priceController.text,
                      id: DateTime.now().microsecondsSinceEpoch);
                  Provider.of<ServicesNotifier>(context, listen: false)
                      .addNote(service);
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }), (route) => false);
                  final users = <String, dynamic>{
                    'Title': _titleController.text,
                    'Name': _nameController.text,
                    'Price': _priceController.text,
                  };
                  FirebaseFirestore.instance
                      .collection('Services')
                      .doc()
                      .set(users);
         })
        ],
      ),
    );
  }
}
