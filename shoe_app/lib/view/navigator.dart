import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/utils/constants.dart';

import 'view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int index = 0;

  // ignore: non_constant_identifier_names
  void Navigate(int value) {
    setState(() {
      index = value;
    });
    _pageController.jumpToPage(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  final List<Widget> pages = [
    const HomeView(),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: CustomNavigationBar(
          iconSize: 23,
          currentIndex: index,
          bubbleCurve: Curves.linear,
          selectedColor: AppConstantsColor.materialButtonColor,
          onTap: Navigate,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.shopping_cart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person),
            ),
          ]),
    );
  }
}
