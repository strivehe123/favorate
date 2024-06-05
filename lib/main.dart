import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/viewmodel/filter_view_model.dart';
import 'core/viewmodel/meal_view_model.dart';
import 'ui/shared/app_theme.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (ctx) => HYMealViewModel()),
          ChangeNotifierProvider(create: (ctx)=>HYFavorViewModel()),
          ChangeNotifierProvider(create: (ctx)=>HYFilterViewModel()),
          ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(create: (ctx)=> HYMealViewModel(), update:(ctx, filterVM, mealVM ){
            mealVM!.updateFilters(filterVM);
            return mealVM;
          })
     ],
    child: const MyApp(),
  ) );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    HYSizeFit.init(context);
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.lightTheme,
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routes,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute:  HYRouter.unknownRoute,
    );
  }
}
