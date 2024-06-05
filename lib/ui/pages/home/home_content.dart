
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:flutter/material.dart';
import '../../../core/model/category_model.dart';
import 'home_content_item.dart';

class HomeContent extends StatelessWidget{
  const HomeContent({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<HYCategoryModel>>(
        future: CategoryJsonParse.getCategoryData(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final categories=snapshot.data!;

          return  GridView.builder(
            padding: EdgeInsets.all(20.rpx),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20.px,mainAxisSpacing: 20.px,childAspectRatio: 1.5),
            itemBuilder: (ctx,index){

              return HYHomeCategoryItem(categories[index]);
            },
          );
        })    ;
  }
}