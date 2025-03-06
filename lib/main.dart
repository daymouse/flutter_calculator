// main.dart
import 'package:flutter/material.dart';
import 'package:calculator_flutter/calculator.dart';
import 'package:calculator_flutter/riwayat.dart';
import 'package:calculator_flutter/profile.dart';
import 'navbar.dart';
import 'package:provider/provider.dart';
import 'providerhis.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
      ],
      child: const MaterialApp(
        home: MainScreen(), // Gantilah dengan halaman utama aplikasi
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
    return Scaffold(
  appBar: AppBar(
    title: const Text('Ngitung'),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold, // Gunakan fontWeight untuk bold
      color: Colors.white,
    ),
    backgroundColor: Colors.blue,
  ),
  body: _pages[_selectedIndex],
  bottomNavigationBar: MyNavbar(
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
  ),
);
  }
}
