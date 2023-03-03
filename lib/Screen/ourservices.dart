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
            )
          ],
        ));
  }
}
