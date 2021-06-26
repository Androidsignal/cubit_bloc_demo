import 'package:bloc_pattern_demo/commons/gloable.dart';
import 'package:bloc_pattern_demo/features/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 3),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(),
          Container(),
          Container(),
          NotificationScreen(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: appTheme.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(images.unSelectedHomeIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(images.unSelectedSearchIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(images.centerMenuIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(images.notificationSelectedIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(images.unSelectedHomeIcon),
            label: '',
          ),
        ],
      ),
    );
  }
}
