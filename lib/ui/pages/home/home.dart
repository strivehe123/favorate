import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';
import 'home_content.dart';
class HYHomeScreen extends StatelessWidget {
  const HYHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('美食广场',style: TextStyle(color: Colors.white),),
        // 从主题中获取颜色
        backgroundColor: Theme.of(context).primaryColorLight,
        // 从主题中获取文本颜色

        centerTitle: true,
      ),
      body: const HomeContent(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
           Container(
             height: 200.rpx,
             child: DrawerHeader(
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColorLight,
               ),
               child: Text('Drawer Header',style:   TextStyle(color: Colors.white),),
             ),
           ),
            // 图标 + 文字
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text('过滤'),
              ),
              onTap: (){
                Navigator.of(context).pushNamed(HYFilterScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Item 2'),
            ),
          ],
    ),
    ),
    );
  }
}