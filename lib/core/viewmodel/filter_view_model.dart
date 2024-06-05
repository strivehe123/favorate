import 'package:flutter/material.dart';

class HYFilterViewModel extends ChangeNotifier{
  bool  _isGreateFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  bool get isGreateFree => _isGreateFree;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegan => _isVegan;
  bool get isVegetarian => _isVegetarian;

  set isGreateFree(bool value) {
    _isGreateFree = value;
    notifyListeners();
  }
  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }
  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  void updateFilter({required bool isGreateFree, required bool isLactoseFree, required bool isVegan, required bool isVegetarian}) {
    _isGreateFree = isGreateFree;
    _isLactoseFree = isLactoseFree;
    _isVegan = isVegan;
    _isVegetarian = isVegetarian;
    notifyListeners();
  }
}