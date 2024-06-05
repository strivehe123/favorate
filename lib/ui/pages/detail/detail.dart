import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

import 'detail_content.dart';
import 'package:flutter/material.dart';

import '../../../core/model/meal_model.dart';

class HYDetailScreen  extends StatelessWidget {
  static const String routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as HYMealModal;
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        backgroundColor:  Theme.of(context).primaryColorLight,

        title: Text(meal.title,style:   TextStyle(color: Colors.white),),
      ),
      body:HYDetailContent(meal),
      floatingActionButton:Consumer<HYFavorViewModel>(
        builder:  (ctx,vm,child){
          return  FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: vm.isFavor(meal)? Icon(Icons.favorite,color: Colors.red):Icon(Icons.favorite_border),
            onPressed: (){
              vm.handleFavor(meal);
            },
          );
        }
        ),

    );
  }
}