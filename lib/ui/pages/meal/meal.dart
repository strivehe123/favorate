import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class HYMealScreen extends StatelessWidget {
  static final routeName = '/meal';
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as HYCategoryModel;
    return Scaffold(
      appBar: AppBar(

        title:  Text(category.title! ,style: TextStyle(color: Colors.white),),
        centerTitle:  true,
        // 从主题中获取颜色
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: HYMealContent()
    );
  }
}