import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../Constant/app_size.dart';
import '../Constant/colors.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  String address = "";

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        margin: const EdgeInsets.only(
          left: AppSize.s20,
          top: AppSize.s10 * 4,
        ),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
              size: 26,
            )),
      ),
      Container(
        margin: const EdgeInsets.only(top: 30),
        height: 900,
        child: OpenStreetMapSearchAndPick(
          center: LatLong(27.7019086, 85.3311488),
          buttonColor: kPrimaryColor,
          buttonText: 'Set  Location',
          locationPinIconColor: kPrimaryColor,
          onPicked: (pickedData) {
            setState(() {
              address = pickedData.address;
              Navigator.pop(context);
            });
          },
        ),
      ),
    ]));
  }
}
