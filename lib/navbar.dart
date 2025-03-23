import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800; // Cek ukuran layar

        return AppBar(
          title: const Text("Ngitung"),
          backgroundColor: Colors.blue,
          actions: isDesktop
              ? [
                  _buildNavItem(Icons.calculate, 'Calculatorr', 0),
                  _buildNavItem(Icons.history_toggle_off_sharp, 'History', 1),
                  _buildNavItem(Icons.person_4_outlined, 'Profile', 2),
                ]
              : [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                ],
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return TextButton.icon(
      onPressed: () => onTap(index),
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Tinggi default AppBar
}
