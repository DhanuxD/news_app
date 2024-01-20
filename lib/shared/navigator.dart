// ignore_for_file: prefer_const_constructors, unused_field, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/profile.dart';

class TheNavigator extends StatefulWidget {
  const TheNavigator({super.key});

  @override
  State<TheNavigator> createState() => _TheNavigatorState();
}

class _TheNavigatorState extends State<TheNavigator> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screen = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GNav(
              backgroundColor: Colors.redAccent,
              onTabChange: (value) {
                _pageController.jumpToPage(value);

                setState(() {
                  _selectedIndex = value;
                });
              },
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              gap: 10,
              tabBackgroundColor: Color.fromARGB(41, 255, 255, 255),
              tabs: [
                GButton(
                  icon: Icons.home_filled,
                  hoverColor: Colors.white,
                  text: "Home",
                  textColor: _selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                GButton(
                  icon: Icons.person,
                  hoverColor: Colors.white,
                  text: "profile",
                  textColor: _selectedIndex == 1 ? Colors.white : Colors.black,
                ),
              ]),
        ),
      ),
    );
  }
}
