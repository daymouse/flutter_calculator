// navbar.dart
import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculator'),
        BottomNavigationBarItem(icon: Icon(Icons.history_toggle_off_sharp), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person_4_outlined), label: 'Profile'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      onTap: onTap,
    );
  }
}
