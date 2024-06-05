import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodel/favor_view_model.dart';
import '../pages/meal/meal.dart';

class HYMealItem extends StatelessWidget {
  final HYMealModal meal;
  HYMealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ()
      {
        Navigator.of(context).pushNamed(HYDetailScreen.routeName,arguments: meal);
      },
      child: Card(
        margin: EdgeInsets.all(10.rpx),
        elevation: 5,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.rpx)),
        child: Column(
          children: <Widget>[
            buildBasicInfo(context),
            buidlOperationInfo(context),
          ],
        ),
      ),
    );
  }
  Widget buildBasicInfo(    BuildContext context) {

    return Stack(
       children: [
         ClipRRect(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(24.rpx),
             topRight: Radius.circular(24.rpx)
           ),
           child: Image(
             image: NetworkImage('https://gd-hbimg.huaban.com/189f84c7a4c75176dde8259d1c4045819fa164eb3c65b-R8Mvn3_fw240webp'),
             width: double.infinity,
             height: 400.rpx,
             fit: BoxFit.cover,),
         ),
         Positioned(
             bottom: 0,
             right: 0,
             child: Container(
           width: 400.rpx,
           decoration: BoxDecoration(
             color: Colors.black54,
             borderRadius: BorderRadius.circular(24.rpx),
           ),
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 20.rpx,vertical: 10.rpx),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(
                   meal.title,
                   style: Theme.of( context).textTheme.titleLarge?.copyWith(
                       color: Colors.white
                   ),
                 ),
               ],
             ),
           ),
         ))
        ]      ,
    );

  }

  Widget buidlOperationInfo(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.rpx),
    child: Row(
      mainAxisAlignment:  MainAxisAlignment.spaceAround,
      children: [
        HYOperationItem(Icon(Icons.schedule), '${meal.duration}分钟'),
        HYOperationItem(Icon(Icons.restaurant), '${meal.complexityText}'),
        buildFavorItem(),
    ],),
    );
  }
  Widget buildFavorItem(){
    return Consumer<HYFavorViewModel>(builder: ( ctx,vm,child){
      return GestureDetector(
        child: HYOperationItem(vm!.isFavor(meal)?Icon(Icons.favorite,color:Colors.red,):Icon(Icons.favorite_border),vm!.isFavor(meal)?"已收藏":"未收藏"),
        onTap: (){
          vm.handleFavor(meal);
        },)    ;
    });
  }
}