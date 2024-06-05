import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/meal_item.dart';

class HYFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(
      builder: (BuildContext context, HYFavorViewModel value, Widget? child) {
        // 检查 favorMeals 是否为空
        if (value.favorMeals.isEmpty) {
          // 如果是空的，显示一个空列表的消息或者其他占位内容
          return Center(
            child: Text('收藏列表为空'),
          );
        } else {
          // 如果不为空，正常显示列表
          return ListView.builder(
            itemCount: value.favorMeals.length, // 确保itemCount与列表长度一致
            itemBuilder: (BuildContext context, int index) {
              return HYMealItem(value.favorMeals[index]);
            },
          );
        }
      },
    );
  }
}