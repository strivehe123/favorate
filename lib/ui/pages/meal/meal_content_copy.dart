
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/category_model.dart';

class HYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final category = ModalRoute.of(context)!.settings.arguments as HYCategoryModel;

    return Consumer<HYMealViewModel>(builder: ( ctx,mealVM,child){
      final meals=mealVM.meals.where((meal)=>meal.categories.contains(category.id)).toList();
      return ListView.builder(itemCount: meals.length,itemBuilder: (ctx,index){
          return ListTile(title: Text(meals[index].title),)    ;
      });
    })  ;
  }
}