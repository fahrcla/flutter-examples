// import 'package:flutter/material.dart';

// class CalculProvider with ChangeNotifier {
//   int compteur;
//   double miles;
//   double km;

//   CalculProvider(
//       {required this.compteur, required this.km, required this.miles});
// /*
//   int get counter => _compteur;

//   double get miles => _miles;

//   double get km => _km;*/

//   set counter(int value) {
//     compteur = value;
//   }

//   void increment() {
//     compteur++;
//     // notifyListeners();
//   }

//   void btn_kmTomiles(double valeur) {
//     miles = ((1 / 1.60934) * valeur);
//     notifyListeners();
//   }

//   void btn_milestokm(double valeur) {
//     km = (1.60934 * valeur);
//     notifyListeners();
//   }
// }

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CalculProvider extends ChangeNotifier {
  int _compteur;
  double _miles;
  double _km;

  CalculProvider({required int compteur, required double km, required double miles})
      : _compteur = compteur,
        _km = km,
        _miles = miles;

  int get compteur => _compteur;
  double get miles => _miles;
  double get km => _km;

  set compteur(int value) {
    _compteur = value;
    notifyListeners();
  }

  void increment() {
    _compteur++;
    notifyListeners();
  }

  void btn_kmtomiles(double valeur) {
    _miles = ((1 / 1.60934) * valeur);
    notifyListeners();
  }

  void btn_milestokm(double valeur) {
    _km = (1.60934 * valeur);
    notifyListeners();
  }
}
