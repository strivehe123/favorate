import 'package:flutter/material.dart';
import 'filter_content.dart';
class HYFilterScreen extends StatelessWidget {
  static const routeName = '/filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('筛选',style: TextStyle(color: Colors.white),),
      ),
      body: FilterContent(),
    );
  }
}