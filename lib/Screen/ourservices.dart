import 'package:flutter/material.dart';

import '../Constant/colors.dart';

class OurServices extends StatefulWidget {
  const OurServices({super.key});

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 380,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),

          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
              decoration: BoxDecoration(color: Colors.white,
              boxShadow: const[
                 BoxShadow(blurRadius: 10,color: Color.fromARGB(255, 215, 215, 215))],
              borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 8),
                    child: Image.asset("assets/images/garden.png",height: 60,),
                  ),
                 const Text("Painting",style: TextStyle(fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.w600,color: kPrimaryColor),)
                ],
              ),
              
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
              decoration: BoxDecoration(color: Colors.white,
              boxShadow: const[
                 BoxShadow(blurRadius: 10,color: Color.fromARGB(255, 215, 215, 215))],
              borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 8),
                    child: Image.asset("assets/images/garden.png",height: 60,),
                  ),
                 const Text("Painting",style: TextStyle(fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.w600,color: kPrimaryColor),)
                ],
              ),),
              Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
              decoration: BoxDecoration(color: Colors.white,
              boxShadow: const[
                 BoxShadow(blurRadius: 10,color: Color.fromARGB(255, 215, 215, 215))],
              borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 8),
                    child: Image.asset("assets/images/garden.png",height: 60,),
                  ),
                 const Text("Painting",style: TextStyle(fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.w600,color: kPrimaryColor),)
                ],
              ),),
              Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
              decoration: BoxDecoration(color: Colors.white,
              boxShadow: const[
                 BoxShadow(blurRadius: 10,color: Color.fromARGB(255, 215, 215, 215))],
              borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 8),
                    child: Image.asset("assets/images/garden.png",height: 60,),
                  ),
                 const Text("Painting",style: TextStyle(fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.w600,color: kPrimaryColor),)
                ],
              ),),
              Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
              decoration: BoxDecoration(color: Colors.white,
              boxShadow: const[
                 BoxShadow(blurRadius: 10,color: Color.fromARGB(255, 215, 215, 215))],
              borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 8),
                    child: Image.asset("assets/images/garden.png",height: 60,),
                  ),
                 const Text("Painting",style: TextStyle(fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.w600,color: kPrimaryColor),)
                ],
              ),),
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:fyp/Constant/colors.dart';

// const List<String> list = <String>['Esewa', 'Two', 'Three', 'Four'];

// class DropDown extends StatefulWidget {
//   const DropDown({super.key});

//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: DropdownButtonExample()),
//     );
//   }
// }

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
