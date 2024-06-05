import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/extension/int_extension.dart';
class HYHomeCategoryItem extends StatelessWidget{
  final HYCategoryModel _category;
  const HYHomeCategoryItem(this._category, {super.key});
  @override
  Widget build(BuildContext context) {
    final bgColor=_category.cColor;
    return  GestureDetector(
        child: Container(

          decoration: BoxDecoration(
              color:bgColor,
              borderRadius: BorderRadius.circular(20.rpx),
              gradient: LinearGradient(
                  colors: [
                    bgColor!.withOpacity(0.5),
                    bgColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
          alignment: Alignment.center,
          child: Text(_category.title!,style:Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        ),
        onTap:  (){
          Navigator.of(context).pushNamed(HYMealScreen.routeName,arguments: _category);
        },
    )      ;
  }
}