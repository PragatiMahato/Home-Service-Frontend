// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/Constant/app_size.dart';
import 'package:http/http.dart' as http;

import '../Network/api_const.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({super.key});

  @override
  _UserscreenState createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  List<dynamic> userList = [];

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('${ApiConst.baseUrl}signup'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        userList = data;
      });
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response =
        await http.delete(Uri.parse('${ApiConst.baseUrl}delete/$userId'));
    if (response.statusCode == 200) {
      setState(() {
        userList.removeWhere((user) => user['_id'] == userId);
      });
    } else {
      throw Exception('Failed to delete user');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s20, vertical: AppSize.s10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user['name'].toString()),
                    Text(user['email']),
                    Text(user['password']),
                    Text(user['createdAt'].toString())
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete User'),
                          content: const Text(
                              'Are you sure you want to delete this user?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                deleteUser(user['_id']);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:fyp/Network/api_const.dart';
// import 'package:http/http.dart' as http;

// import '../Constant/app_size.dart';

// class AddService extends StatefulWidget {
//   @override
//   _AddServiceState createState() => _AddServiceState();
// }

// class _AddServiceState extends State<AddService> {
//   final _formKey = GlobalKey<FormState>();
//   final titleController = TextEditingController();
//   final priceController = TextEditingController();

//   @override
//   void dispose() {
//     titleController.dispose();
//     priceController.dispose();
//     super.dispose();
//   }

//   Future addService(String title, double price) async {
//     final apiUrl = Uri.parse("${ApiConst.baseUrl}addService");
//     final response = await http.post(apiUrl,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"title": title, "price": price}));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Failed to add service");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Service"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: titleController,
//                   decoration: const InputDecoration(
//                     labelText: "Title",
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter a title";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: priceController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: "Price",
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter a price";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () async {
//                if (_formKey.currentState!.validate()) {
//                       try {
//                         await addService(titleController.text,
//                             double.parse(priceController.text));
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Service added successfully")));
//                         titleController.clear();
//                         priceController.clear();
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(e.toString())));
//                       }
//                     }
//                      Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ServiceList()),
//     );
//                   },
//                   child: const Text("Add Service"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class ServiceList extends StatefulWidget {
//   @override
//   _ServiceListState createState() => _ServiceListState();
// }

// class _ServiceListState extends State<ServiceList> {
//   List<dynamic> _serviceList = [];

//   @override
//   void initState() {
//     super.initState();
//     _getServiceList();
//   }

//   Future<void> _getServiceList() async {
//     try {
//       final apiUrl = Uri.parse("${ApiConst.baseUrl}getServiceList");
//       final response = await http.get(apiUrl);
//       if (response.statusCode == 200) {
//         setState(() {
//           _serviceList = jsonDecode(response.body);
//         });
//       } else {
//         throw Exception("Failed to load services");
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Services"),
//       ),
//       body: ListView.builder(
//         itemCount: _serviceList.length,
//         itemBuilder: (BuildContext context, int index) {
//           final servic = _serviceList[index];
//           return Card(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: AppSize.s20, vertical: AppSize.s10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(servic['price'].toString()),
//                       Text(servic['title']),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
