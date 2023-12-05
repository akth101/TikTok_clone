import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/tab_navigation/widgets/nav_tab.dart';
import 'package:tiktok/features/tab_navigation/widgets/stf_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    StfScreren(key: GlobalKey()),
    StfScreren(key: GlobalKey()),
    Container(),
    StfScreren(key: GlobalKey()),
    StfScreren(key: GlobalKey()),

    // const Center(
    //   child: Text(
    //     'Home',
    //     style: TextStyle(
    //       fontSize: 49,
    //     ),
    //   ),
    // ),
    // const Center(
    //   child: Text(
    //     'Discover',
    //     style: TextStyle(
    //       fontSize: 49,
    //     ),
    //   ),
    // ),
    // Container(),
    // const Center(
    //   child: Text(
    //     'Inbox',
    //     style: TextStyle(
    //       fontSize: 49,
    //     ),
    //   ),
    // ),
    // const Center(
    //   child: Text(
    //     'Profile',
    //     style: TextStyle(
    //       fontSize: 49,
    //     ),
    //   ),
    // ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreren(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "Home",
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
              selectedIcon: FontAwesomeIcons.house,
            ),
            NavTab(
              text: "Discover",
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
              selectedIcon: FontAwesomeIcons.solidCompass,
            ),
            NavTab(
              text: "Inbox",
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.message,
              onTap: () => _onTap(3),
              selectedIcon: FontAwesomeIcons.solidMessage,
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
              selectedIcon: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
