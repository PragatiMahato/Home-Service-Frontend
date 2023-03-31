import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../Constant/colors.dart';
import 'add_service.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Pragati Mahato",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text("mahatopragati06@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/pp.png",
                  height: 110,
                  width: 110,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 130, 119, 190),
                kPrimaryColor,
              ],
            )),
          ),
          const Listtile(
            icons: Icon(Icons.person),
            title: 'Profile',
          ),
          const Listtile(
            icons: Icon(Icons.home),
            title: 'Home',
          ),
          const Divider(),
          const Listtile(
            icons: Icon(Icons.favorite),
            title: 'Booking',
          ),
          const Listtile(
            icons: Icon(Icons.add),
            title: 'Payment',
          ),
          const Listtile(
            icons: Icon(Icons.settings),
            title: 'Notification',
          ),
          const Listtile(
            icons: Icon(Icons.feedback),
            title: 'Feedback',
          ),
          const Divider(),
          const Listtile(
            icons: Icon(Icons.logout),
            title: 'Log Out',
            // onTap: () {
            //   handleLogout();
            // },
          ),
          
        ],
      ),
    );
  }
}

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
    required this.title,
    required this.icons,
    this.onTap,
  });
  final String title;
  final Icon icons;
  final Callback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icons,
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, color: textColor),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const AddService();
        }));
      },
    );
  }

  // Future<void> handleLogout() async {
  //   await FirebaseAuth.instance.signOut();
  // }
}
