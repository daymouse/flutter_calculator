import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerhis.dart';

class RiwayatHal extends StatefulWidget {
  const RiwayatHal({super.key});

  @override
  _RiwayatHalState createState() => _RiwayatHalState();
}

class _RiwayatHalState extends State<RiwayatHal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Perhitungan")),
      body: Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) {
          var history = historyProvider.history;

          return history.isEmpty
              ? const Center(child: Text("Belum ada riwayat perhitungan"))
              : ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(history[index]),
                    );
                  },
                );
        },
      ),
    );
  }
}
