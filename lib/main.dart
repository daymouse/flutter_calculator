import 'package:flutter/material.dart';
import 'package:calculator_flutter/calculator.dart';
import 'package:calculator_flutter/riwayat.dart';
import 'package:calculator_flutter/profile.dart';
import 'package:provider/provider.dart';
import 'providerhis.dart';
import 'navbar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
      ],
      child: const MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const Calculator(),
    const RiwayatHal(),
    const Profil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;

        return Scaffold(
          appBar: MyNavbar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body: _pages[_selectedIndex],

          // Gunakan Builder agar mendapatkan context yang benar
        bottomNavigationBar: isDesktop
          ? null
          : null,


          // Drawer hanya di mobile
          endDrawer: isDesktop
              ? null
              : Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text(
                          'Menu',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calculate),
                        title: const Text('Calculator'),
                        onTap: () => _onItemTapped(0),
                      ),
                      ListTile(
                        leading: const Icon(Icons.history_toggle_off_sharp),
                        title: const Text('History'),
                        onTap: () => _onItemTapped(1),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_4_outlined),
                        title: const Text('Profile'),
                        onTap: () => _onItemTapped(2),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
