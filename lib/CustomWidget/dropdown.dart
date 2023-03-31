// import 'package:flutter/material.dart';

// import '../Constant/colors.dart';
// import '../Screen/booking.dart';


// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(
//         Icons.arrow_drop_down,
//         size: 37,
//         color: kPrimaryColor,
//       ),
//       elevation: 4,
//       style: const TextStyle(color: Colors.deepPurple, fontSize: 18),
//       underline: Container(
//         height: 2.5,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
