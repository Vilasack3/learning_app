import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/search/search_page.dart';
import 'package:learning_app/pages/user/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    SearchPage(),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    const ProfilePage(),
  ];
  return widget[index];
}

var bottomNavigator = [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(
      Icons.home_outlined,
      size: 22.w,
    ),
    activeIcon: Icon(
      Icons.home,
      size: 22.w,
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: Icon(
      Icons.manage_search_outlined,
      size: 22.w,
    ),
    activeIcon: Icon(
      Icons.manage_search,
      size: 22.w,
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: Icon(
      Icons.play_circle_outlined,
      size: 22.w,
    ),
    activeIcon: Icon(
      Icons.play_circle,
      size: 22.w,
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: Icon(
      Icons.chat_outlined,
      size: 22.w,
    ),
    activeIcon: Icon(
      Icons.chat,
      size: 22.w,
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: Icon(
      Icons.account_circle_outlined,
      size: 22.w,
    ),
    activeIcon: Icon(
      Icons.account_circle,
      size: 22.w,
    ),
  ),
];
