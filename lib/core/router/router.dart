import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
class HYRouter{

  static final String initialRoute = HYMainScreen.routeName;

  static final Map<String,WidgetBuilder> routes = {
   HYMainScreen.routeName   :(context) =>  HYMainScreen(),
   HYMealScreen.routeName   :(context) => HYMealScreen(),
   HYDetailScreen.routeName:(context)=>HYDetailScreen(),
   HYFilterScreen.routeName:(context)=>HYFilterScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    if(settings.name == HYMainScreen.routeName){
      return MaterialPageRoute(builder: (context) => HYMainScreen());
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (context) => HYMainScreen());
  };
}