import 'package:flutter/material.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/view/home/home.dart';
import 'package:nutrimate/view/meals/meals_detail.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  PageController pageController=PageController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: pageController,
        children: const [
          Home(),
          MealDetails(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Meal',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColor.secondaryColor2,
        onTap: _onItemTapped,
      ),
    );
  }
}
