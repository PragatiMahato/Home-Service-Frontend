import 'package:flutter/material.dart';

import '../Constant/app_size.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Menu",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 90, 90, 90)),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 27,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // const SearchBar(),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: AppSize.getScreenHeight(context) * 0.6,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                        height: double.infinity,
                        width: 100,
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            color: Color.fromARGB(255, 97, 43, 139))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          GestureDetector(
                            onTap: (){},
                            child: ServicesCard(imageShape: ClipOval(
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        "assets/images/paint.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ), count: 'Many', name: 'Service',),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                         GestureDetector(
                          onTap: (){},
                           child: ServicesCard(imageShape: ClipOval(
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        "assets/images/cooking.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ), count: 'Many', name: 'Service',),
                         ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: ServicesCard(imageShape: ClipOval(
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        "assets/images/cooking.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ), count: 'Many', name: 'Service',),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: ServicesCard(imageShape: ClipOval(
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        "assets/images/cooking.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ), count: 'Many', name: 'Service',),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key, required this.name, required this.count, required this.imageShape,
  });
  final String name;
  final String count;
  // ignore: prefer_typing_uninitialized_variables
  final  imageShape;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          height: 80,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 95, 95, 95),
                    offset: Offset(0, 5),
                    blurRadius: 10)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 68, 68, 68),
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
               Text(
                "$count services",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerLeft,
            child: imageShape
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 5)
                  ]),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        )
      ],
    );
  }
}

