import 'package:favorcate/core/model/meal_model.dart';

import 'http_request.dart';
class HYMealRequest {
  static Future getMealData() async {
    const url='/category';
    final result= await HttpRequest.request(url);
    final mealArray=result['meal'];
    List<HYMealModal> meals=[];
    for(var json in mealArray){
      final meal=HYMealModal.fromJson(json);
      meals.add(meal);
    }
    return meals;
  }
}