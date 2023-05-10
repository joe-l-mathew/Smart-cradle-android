import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int minutes = 0;
  changeTime(int minut,) {
    minutes = minut;
    notifyListeners();
  }
}
