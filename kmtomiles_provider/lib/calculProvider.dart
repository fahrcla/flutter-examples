import 'package:flutter/material.dart';

class CalculProvider extends ChangeNotifier {
  
  double _miles;
  double _km;

  CalculProvider({ required double km, required double miles})
      :  _km = km,
        _miles = miles;

  double get miles => _miles;
  double get km => _km;

   void btn_kmtomiles(double valeur) {
    _miles = ((1 / 1.60934) * valeur);
    notifyListeners();
  }

  void btn_milestokm(double valeur) {
    _km = (1.60934 * valeur);
    notifyListeners();
  }
}
