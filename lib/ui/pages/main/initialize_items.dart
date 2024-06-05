import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
final List<Widget> pages=[
  HYHomeScreen(),
  HYFavorScreen(),
];
final List<BottomNavigationBarItem> items=[

  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '首页',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: '收藏',
  ),

];