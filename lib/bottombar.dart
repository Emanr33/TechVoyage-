// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wardrobe/Rating.dart';
import 'package:wardrobe/favorite_screen.dart';
import 'package:wardrobe/helpAndSupport_screen.dart';
import 'package:wardrobe/main_Screen/first_screen.dart';

import 'package:wardrobe/notifaction.dart';
import 'package:wardrobe/referFreind_screen.dart';
import 'package:wardrobe/setting_screen.dart';
import 'package:wardrobe/boarding_screen.dart';
import 'package:wardrobe/staticData.dart';

class bottombar extends StatefulWidget {
  final String selectedCity;
  const bottombar({Key? key, required this.selectedCity}) : super(key: key);

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int selectedindex = 0;
  late List<Widget> screens; // we are selecting at run time

  @override
  void initState() {
    super.initState();
    screens = [
      FirstScreen(selectedCity: widget.selectedCity),
      // main_first(selectedCity: widget.selectedCity),
      const FavoriteScreen(),
      // FirstScreen(selectedCity: widget.selectedCity),
      const notification(),
      const RatingScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        // backgroundColor: Colors.blueAccent,
        backgroundColor: const Color.fromARGB(255, 157, 62, 173),

        selectedLabelStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        iconSize: 25.0,
        currentIndex: selectedindex,
        onTap: (int index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 157, 62, 173),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 157, 62, 173),
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            // icon: Icon(
            //   // Icons.notification_add,

            //   color: const Color.fromARGB(255, 157, 62, 173),
            // ),

            icon: SizedBox(
              height: 25,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(
                      255, 157, 62, 173), // Change these colors as needed
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset('assets/images/shirt.svg'),
              ),
            ),
            label: 'Try Room',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Color.fromARGB(255, 157, 62, 173),
            ),
            label: 'Rate us',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedindex,
        children: screens,
      ),
    );
  }
}

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Data.myAccount = true;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BoardingScreen()),
              );
              // Add your logic here for Drawer Item 1
            },
          ),
          ListTile(
            title: const Text(
              'Refer a Friend',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ReferFrind()),
              );
              // Add your logic here for Drawer Item 2
            },
          ),
          ListTile(
            title: const Text(
              'Setting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingScreen()),
              );
              // Add your logic here for Drawer Item 3
            },
          ),
          ListTile(
            title: const Text(
              'Help',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HelpAndSupport()),
              );
              // Add your logic here for Drawer Item 4
            },
          ),
          // Add more ListTile widgets for additional items if needed
        ],
      ),
    );
  }
}
