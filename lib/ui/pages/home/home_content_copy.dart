
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';
import 'home_content.dart';
import 'home_content_item.dart';

class HomeContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<HYCategoryModel>>(
        future: CategoryJsonParse.getCategoryData(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final categorys=snapshot.data!;

          return  GridView.builder(
            padding: EdgeInsets.all(20.rpx),
            itemCount: categorys.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20.px,mainAxisSpacing: 20.px,childAspectRatio: 1.5),
            itemBuilder: (ctx,index){

              return HYHomeCategoryItem(categorys[index]);
            },
          );
        })    ;
  }
}