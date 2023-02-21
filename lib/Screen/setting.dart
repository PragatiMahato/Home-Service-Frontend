// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 28, 35),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 28, 28, 35),
            title: Text('Setting'),
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.back,
                  color: Color.fromARGB(255, 162, 162, 181),
                ))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 7, top: 30),
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage('assets/images/Avatar.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "John Deo",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text("j.deo@gmail.com",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 162, 162, 181),
                      height: 1.5)),
              SizedBox(
                height: 25,
              ),
              Container(
                // margin: EdgeInsets.only(left: 50),
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color.fromARGB(255, 51, 51, 57),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Airbnb Cereal App",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'General',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 120,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 38, 38, 47),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(padding: EdgeInsets.only(left: 15, top: 70)),
                        IconButton(onPressed: (){},
                         icon: Icon(Icons.account_box)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'My Account',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 160, right: 10),
                        //   child: Text('FaceID',
                        //       style: TextStyle(
                        //           fontFamily: 'Inter',
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //           color: Color.fromARGB(255, 162, 162, 181),
                        //           height: 1.5)),
                        // ),
                        // Image(image: AssetImage('assets/images/arrow.png'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20, top: 40)),
                        // Image(
                        //   image: AssetImage('assets/images/icloud.png'),
                        // ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Theme',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 130, right: 10),
                        //   child: Text('FaceID',
                        //       style: TextStyle(
                        //           fontFamily: 'Inter',
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //           color: Color.fromARGB(255, 162, 162, 181),
                        //           height: 1.5)),
                        // ),
                        // Image(image: AssetImage('assets/images/arrow.png'))
                        
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 165,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 38, 38, 47),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(padding: EdgeInsets.only(left: 15, top: 70)),
                        // Image(
                        //   image: AssetImage('assets/images/sorting.png'),
                        // ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.payment)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Payment',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 185, right: 10),
                          child: Text('Date',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 162, 162, 181),
                                  height: 1)),
                        ),
                        // Image(image: AssetImage('assets/images/arrow.png'))
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   // ignore: prefer_const_literals_to_create_immutables
                    //   children: [
                    //     Padding(padding: EdgeInsets.only(left: 15, top: 30)),
                    //     Image(
                    //       image: AssetImage('assets/images/summary.png'),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     Text(
                    //       ' Summary',
                    //       style: TextStyle(
                    //           fontFamily: 'Inter',
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600,
                    //           color: Colors.white),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.only(left: 140, right: 10),
                    //       child: Text('Average',
                    //           style: TextStyle(
                    //               fontFamily: 'Inter',
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w500,
                    //               color: Color.fromARGB(255, 162, 162, 181),
                    //               height: 1)),
                    //     ),
                    //     Image(image: AssetImage('assets/images/arrow.png'))
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   // ignore: prefer_const_literals_to_create_immutables
                    //   children: [
                    //     Padding(padding: EdgeInsets.only(left: 15, top: 65)),
                    //     Image(
                    //       image: AssetImage('assets/images/default.png'),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     Text(
                    //       ' Default Currency',
                    //       style: TextStyle(
                    //           fontFamily: 'Inter',
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600,
                    //           color: Colors.white),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.only(left: 100, right: 10),
                    //       child: Text('USD',
                    //           style: TextStyle(
                    //               fontFamily: 'Inter',
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w500,
                    //               color: Color.fromARGB(255, 162, 162, 181),
                    //               height: 1)),
                    //     ),
                    //     Image(image: AssetImage('assets/images/arrow.png'))
                    //   ],
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Appreance',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              // Container(
              //   margin: EdgeInsets.only(top: 8),
              //   height: 165,
              //   width: 370,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     color: Color.fromARGB(255, 38, 38, 47),
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         // ignore: prefer_const_literals_to_create_immutables
              //         children: [
              //           Padding(padding: EdgeInsets.only(left: 15, top: 70)),
              //           Image(
              //             image: AssetImage('assets/images/app_icon.png'),
              //           ),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Text(
              //             'App icon',
              //             style: TextStyle(
              //                 fontFamily: 'Inter',
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white),
              //           ),
              //           Container(
              //             padding: EdgeInsets.only(left: 155, right: 10),
              //             child: Text('Default',
              //                 style: TextStyle(
              //                     fontFamily: 'Inter',
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                     color: Color.fromARGB(255, 162, 162, 181),
              //                     height: 1)),
              //           ),
              //           Image(image: AssetImage('assets/images/arrow.png'))
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         // ignore: prefer_const_literals_to_create_immutables
              //         children: [
              //           Padding(padding: EdgeInsets.only(left: 15, top: 30)),
              //           Image(
              //             image: AssetImage('assets/images/theme.png'),
              //           ),
              //           SizedBox(
              //             width: 15,
              //           ),
              //           Text(
              //             ' Theme',
              //             style: TextStyle(
              //                 fontFamily: 'Inter',
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white),
              //           ),
              //           Container(
              //             padding: EdgeInsets.only(left: 190, right: 10),
              //             child: Text('Dark',
              //                 style: TextStyle(
              //                     fontFamily: 'Inter',
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                     color: Color.fromARGB(255, 162, 162, 181),
              //                     height: 1)),
              //           ),
              //           Image(image: AssetImage('assets/images/arrow.png'))
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         // ignore: prefer_const_literals_to_create_immutables
              //         children: [
              //           Padding(padding: EdgeInsets.only(left: 15, top: 65)),
              //           Image(
              //             image: AssetImage('assets/images/default.png'),
              //           ),
              //           SizedBox(
              //             width: 15,
              //           ),
              //           Text(
              //             ' Default Currency',
              //             style: TextStyle(
              //                 fontFamily: 'Inter',
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white),
              //           ),
              //           Container(
              //             padding: EdgeInsets.only(left: 110, right: 10),
              //             child: Text('USD',
              //                 style: TextStyle(
              //                     fontFamily: 'Inter',
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                     color: Color.fromARGB(255, 162, 162, 181),
              //                     height: 1)),
              //           ),
              //           Image(image: AssetImage('assets/images/arrow.png'))
              //         ],
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
