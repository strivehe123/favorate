import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
class CategoryJsonParse{
  static Future<List<HYCategoryModel>> getCategoryData() async {
    final jsonString =await rootBundle.loadString('assets/json/category.json');
    final jsonResponse = json.decode(jsonString );
    final result=jsonResponse['category'] as List;
    List<HYCategoryModel> categorys=[];
    for (var item in result) {
      categorys.add(HYCategoryModel.fromJson(item));
    }
    return categorys;
  }
}