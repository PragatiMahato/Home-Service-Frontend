import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../Constant/colors.dart';
import 'services.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Home", "Search", "Booking", "Profile"],
        icons: const [
          Icons.home,
          Icons.search,
          Icons.calendar_month_rounded,
          Icons.person
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: kPrimaryColor,
        tabIconSize: 33.0,
        tabIconSelectedSize: 30.0,
        tabSelectedColor: kPrimaryColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color.fromARGB(255, 213, 213, 213),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Center(
            child: HomePage(),
          ),
          const Center(child: HomePage()),
          const Center(child: HomePage()),
          const Center(
            // child: ProfileScreen(),
          ),
        ],
      ),
    );
  }
}
