import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:merointernship/screens/homepage.dart';
import 'package:merointernship/screens/profilescreen.dart';
import 'package:merointernship/screens/settingscreen.dart';
import 'package:merointernship/theme/color.dart';

int _currentIndex = 0;
List pageList = [
  Homepage(),
  Profile(),
  Setting(),
];

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width - 20,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
          child: BottomNavBar(
            showElevation: true,
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
                Get.to(pageList[_currentIndex]);
              });
            },
            items: <BottomNavBarItem>[
              BottomNavBarItem(
                title: 'HOME',
                icon: const Icon(Icons.home),
                activeColor: primarycolor,
                inactiveColor: Colors.grey,
              ),
              BottomNavBarItem(
                title: 'PROFILE',
                icon: const Icon(Icons.person),
                activeColor: primarycolor,
                inactiveColor: Colors.grey,
              ),
              BottomNavBarItem(
                title: 'SETTINGS',
                icon: const Icon(Icons.settings),
                inactiveColor: Colors.grey,
                activeColor: primarycolor,
              ),
            ],
          )),
    );
  }
}
