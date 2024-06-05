
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:collection/collection.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/category_model.dart';

class HYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final category = ModalRoute.of(context)!.settings.arguments as HYCategoryModel;

    return Selector<HYMealViewModel,List<HYMealModal>>(
        selector:(ctx,vm)=>vm.meals.where((meal)=>meal.categories.contains(category.id)).toList(),
        shouldRebuild: (prev,next)=> !const ListEquality().equals(prev,next),
        builder: (ctx,meals,child){
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx,index){
                return HYMealItem(meals[index]);
              });
        })    ;
  }
}