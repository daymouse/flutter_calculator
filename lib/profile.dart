import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, 
            ),
            constraints: BoxConstraints(
              minWidth: 120, minHeight: 120,
            ),
            child: Icon(Icons.person_4_outlined, size: 60, color: Colors.white),
          ),
          
         
          SizedBox(height: 12),
          
         
          Text(
            'Nama: Dzulfikar Lintang S',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black, // Warna teks lebih kontras
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'NIS: 17222',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            'JURUSAN: RPL',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
