import 'package:favorcate/core/extension/int_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/model/meal_model.dart';
class HYDetailContent extends StatelessWidget {

  final HYMealModal meal;

  HYDetailContent(this.meal);
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          bulidBannerImage(),
          buildMaterialTitle(context,'制作材料'),
          buildMkaeMaterial(  context),
          buildMaterialTitle(context,'制作步骤 '),
          buildMakeStage(context)
        ],
      ),
    );
  }
  Widget bulidBannerImage() {
    return Container(
      // padding
      padding: EdgeInsets.all(10.rpx),
      // 边框
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.rpx)
      ),
      child:
      ClipRRect(borderRadius: BorderRadius.circular(24.rpx),
        child: Image.network('https://gd-hbimg.huaban.com/189f84c7a4c75176dde8259d1c4045819fa164eb3c65b-R8Mvn3_fw240webp',
          fit: BoxFit.fitWidth,  width: double.infinity,height: 400.rpx,),),);
  }
  Widget buildMkaeMaterial(BuildContext context) {
    return buildMakeContent(context: context, child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meal.ingredients.length,
        itemBuilder: itemBuilder));
  }
  Widget buildMakeStage(BuildContext context) {
    return buildMakeContent(context: context, child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meal.steps.length,
        itemBuilder: (ctx,index){
          return ListTile(
            leading: CircleAvatar(backgroundColor:Theme.of(context).primaryColorLight, child: Text('#${index+1}'),),
            title: Text(meal.steps[index]),
          );
        },
        separatorBuilder: (ctx,index)=>Divider(height: 1, color: Colors.grey,)));


  }
  Widget buildMaterialTitle(BuildContext context,String title){
    return Container(
      padding: EdgeInsets.all(10.rpx),
      child: Text(title,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
    ) ;
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Card(
      // 使用主题颜色
      color:Theme.of(context).primaryColorLight,

      child: Container(
        padding: EdgeInsets.only(left: 20.rpx,top: 5.rpx,bottom: 5.rpx),

        child: Center(child: Text(meal.ingredients[index],style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),),
      ),
    );
  }
  Widget buildMakeContent({required BuildContext context,required Widget child}){

    return Container(
      width: MediaQuery.of(context).size.width-60.rpx,
      padding: EdgeInsets.all(10.rpx),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.rpx)
      ),
      child: child,
    );
  }
}