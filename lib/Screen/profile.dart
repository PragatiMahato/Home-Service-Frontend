import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: kPrimaryColor,
              width: double.infinity,
              height: AppSize.s30 * 7.5,
              padding: AppSize.globalSymetricpadding * 2,
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(
                        'assets/images/pp.png',
                        height: 110,
                      )),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  const Text(
                    "Pragati Mahato",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: backgroundWhite),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: const[
              ProfileRow(
                name: 'Name',
                picon:  Icon(Icons.person),
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
          )
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.name,
    required this.picon, this.onpress,
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
          IconButton(onPressed: onpress, icon: const Icon(Icons.edit,color: Colors.black,))
        ],
      ),
    );
  }
}
