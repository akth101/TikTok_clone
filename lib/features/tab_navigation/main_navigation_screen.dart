import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/discover/discover_screen.dart';
import 'package:tiktok/features/inbox/inbox_screen.dart';
import 'package:tiktok/features/tab_navigation/widgets/nav_tab.dart';
import 'package:tiktok/features/tab_navigation/widgets/post_video_button.dart';
import 'package:tiktok/features/users/user_profile_screen.dart';
import 'package:tiktok/features/videos/video_timeline_screen.dart';
import 'package:tiktok/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  //대부분의 browser에서는 소리가 포함된 영상을 즉시 재생할 수 없게 한다.
  //광고회사들이 소리까지 자동으로 재생시켜서 광고를 때리는 바람에 그렇다.
  //소리가 없는 동영상은 가능한데, 소리가 있는 동영상은 바로 못한다.

  final screens = [
    Container(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostvideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text("Record Video")),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "니꼬",
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "Home",
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
              selectedIcon: FontAwesomeIcons.house,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              text: "Discover",
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
              selectedIcon: FontAwesomeIcons.solidCompass,
              selectedIndex: _selectedIndex,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostvideoButtonTap,
              child: PostVideoButton(inverted: _selectedIndex != 0),
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.message,
              onTap: () => _onTap(3),
              selectedIcon: FontAwesomeIcons.solidMessage,
              selectedIndex: _selectedIndex,
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
              selectedIcon: FontAwesomeIcons.solidUser,
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
