import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Modal/usermodal.dart';

class UserRepository extends GetxController {
  static UserRepository get instance {
    return Get.find();
  }

  final _db = FirebaseFirestore.instance;
  createUser(UserModal user) async{
   await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.amber,
              colorText: Colors.black),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 255, 77, 7),
        colorText: Colors.black,
      );
    });
  }
}
