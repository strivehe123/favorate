import 'package:flutter/material.dart';
import '../model/meal_model.dart';

class HYFavorViewModel extends ChangeNotifier {
  List<HYMealModal> _favorMeals = [];
  List<HYMealModal> get favorMeals => _favorMeals;
  void add (HYMealModal meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }
  void remove (HYMealModal meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }
  void handleFavor(HYMealModal meal){
    if(isFavor(meal)){
      remove(meal);
    }else{
      add(meal);
    }
    notifyListeners();
  }
  bool isFavor(HYMealModal meal) {
    return _favorMeals.contains(meal);
  }
}
