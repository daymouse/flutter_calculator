import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  final List<String> history = [];

  void addHistory(String entry) {
    history.insert(0, entry);
    notifyListeners();
  }

  void clearHistory() {
    history.clear();
    notifyListeners();
  }
}