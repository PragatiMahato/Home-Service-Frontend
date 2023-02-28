import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

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
        appBar: AppBar(
          iconTheme: const IconThemeData(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,
                child: Text(address),
              ),
              SizedBox(height: 700,
                child: OpenStreetMapSearchAndPick(
                  center: LatLong(23, 89),
                  buttonColor: Colors.blue,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    setState(() {
                      address = pickedData.address;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
