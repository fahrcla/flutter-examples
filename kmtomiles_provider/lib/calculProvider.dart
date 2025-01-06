import 'package:flutter/material.dart';

class CalculProvider with ChangeNotifier {
  int compteur;
  double miles;
  double km;

  CalculProvider(
      {required this.compteur, required this.km, required this.miles});
/*
  int get counter => _compteur;

  double get miles => _miles;

  double get km => _km;*/

  set counter(int value) {
    compteur = value;
  }

  void increment() {
    compteur++;
    // notifyListeners();
  }

  void btn_kmTomiles(double valeur) {
    miles = ((1 / 1.60934) * valeur);
    notifyListeners();
  }

  void btn_milestokm(double valeur) {
    km = (1.60934 * valeur);
    notifyListeners();
  }
}
