import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../model/meal_model.dart';
import '../services/meal_request.dart';

class HYMealViewModel extends ChangeNotifier{
  HYFilterViewModel? _filterViewModel;
  List<HYMealModal> _meals=[];

  List<HYMealModal> get meals{
    return _meals.where((meal){
      if(_filterViewModel!.isGreateFree && !meal.isGlutenFree){
        return false;
      }
      if(_filterViewModel!.isLactoseFree && !meal.isLactoseFree){
        return false;
      }
      if(_filterViewModel!.isVegan && !meal.isVegan){
        return false;
      }
      if(_filterViewModel!.isVegetarian && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  }
  void updateFilters(HYFilterViewModel filterViewModel){
     _filterViewModel=filterViewModel;
  }
  HYMealViewModel(){
    HYMealRequest.getMealData().then((value) {
      _meals=value;
      notifyListeners();
    });
  }
}