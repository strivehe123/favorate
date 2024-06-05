import 'dart:ui';

class HYCategoryModel {
  String? id;
  String? title;
  String? color;
  Color cColor;

  // Initialize cColor in the constructor
  HYCategoryModel({this.id, this.title, this.color})
      : cColor = Color(int.parse(color!, radix: 16) | 0xFF000000);

  HYCategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        color = json['color'],
        cColor = Color(int.parse(json['color']!, radix: 16) | 0xFF000000);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}